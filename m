Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C689CA5FCE
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Oct 2026 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KwIxi71Na1Unv96JFWJim7ZrLMsot7HRoeh0oN4dvGk=; b=XAHqyCCP90hnYaf49LHzP24VRO
	o4Ulkx5Z3fWeZzNjJLh0j74I8mc0wy4ymwUIrd9VVYh9L1+xdNn1PWo4N9aJWANw+fK2Hq5WoUuqz
	Lw5FNky1cjDVGIwmi3J51kl15vjox4xIkZRUcso/qPTrejqAGv4wQV32SXVh8nyYRCiOdmviqQ8BR
	V8ubKa/PBQGI4+ebwCJPFMcbYV68NqpyVyYlYqNaFNxCqheP++hH67y8nt5K0WQG23NJle0uyDxz3
	6Tkm/nE7pcvHReECK9h36kiaUUFNSc0o68xlwEwLFYOPrkJEZen3QjSxlvF/HCTEPg6NQH9RkSa68
	pvaf2Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTNX-0000000AWm7-4B9u;
	Fri, 02 Oct 2026 02:52:07 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTNU-0000000AWlg-3SrY
	for linux-i3c@lists.infradead.org;
	Fri, 02 Oct 2026 02:52:06 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 02 Oct 2026 11:52:01 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id ED4B5206807C;
	Fri,  2 Oct 2026 11:52:00 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Fri, 2 Oct 2026 11:52:00 +0900
Received: from [10.212.247.157] (unknown [10.212.247.157])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 5ADFF10D843;
	Fri,  2 Oct 2026 11:52:00 +0900 (JST)
Message-ID: <2b18d52b-a245-4c7d-abb2-622cd3cea428@socionext.com>
Date: Fri, 2 Oct 2026 11:51:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Peter Yin <peteryin.openbmc@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [REGRESSION] i3c: dw: Duplicate I2C client registration
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_195205_011994_ACC8BF0E 
X-CRM114-Status: GOOD (  14.38  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

I found a regression due to commit f26ecaa0f0ab
("i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter").

If an I2C device is described as a child device of a DesignWare I3C
controller, the I2C client will be double instantiated after this commit.

The sequence appears to be:

1. device_set_of_node_from_dev() assigns the OF node of the I3C controller
    to the virtual I2C adapter.

2. i2c_add_adapter() then detects the OF node and instantiates the I2C child
    node through the normal I2C OF path.

3. The same child node has already been parsed by the I3C core and added to
    master->boardinfo.i2c.

4. i3c_master_i2c_adapter_init() then calls i2c_new_client_device() again
    for the same device again and fails with -EBUSY.

For example, I see the following error:
>    i2c i2c-4: Failed to register i2c client ptn5110 at 0x50 (-16)

Without commit f26ecaa0f0ab, i2c_add_adapter() will not instantiate any child
nodes because the virtual I2C adapter has no OF nodes.
The client is successfully instantiated from master->boardinfo.i2c as before.

After applying commit f26ecaa0f0ab, the client instantiated in the first path
(via i2c) is registered and functional. In my case, it is successfully bound to
the tcpci driver.
However, the second registration fails with -EBUSY, and i2cdev->dev is set to
ERR_PTR(-EBUSY) instead of valid I2C client.

I originally reproduced this on v6.12.y, and I have also confirmed the duplicate
client instantiation on v7.2.

The OF node is necessary for the purpose of commit f26ecaa0f0ab, but the I3C core
also needs to properly handle I2C devices written under the I3C controller,
and I'm not sure what the proper fix is.

I'd like to report the regression and the duplicate enumeration of child devices.
If this issue has already been reported or discussed, please disregard this report.

Thanks,

---
Best Regards
Kunihiko Hayashi

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
