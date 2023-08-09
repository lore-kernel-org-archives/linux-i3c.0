Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A1FC001DE
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 00:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83ad4vf+cWAk1e7F5kveg0gmEqmASZF9h8wcx5KZ3SM=; b=RK2mMNUM3tgqTp
	ERDuurrq50u+z5ox4l8yRAwTIYlghFy/nlpmK0q9r13TXz4DSMKin7V3IxLA8mnwvzk7cQDjCZqbn
	r0z4zaAFA2P2q3pzzreaqNv/Or+IRtKg+2Av9WPnFgelJarjEzOltZ4u9TbDU6HAqgJH/S24DNOuf
	ENjSa98q930Ge6PI3GC1ib4+kNZen7UbFlljofthvyyYnp/2P+l7XTMqPTKs6CwDLWc3+VLhO0Mj/
	N0N7z1pcl8u7+JEdGpzATRT3ZzTLeEj9H6K+v8899Wd033udiXYx2EmsQHeouU3trNyJvmbbhtZeH
	aJF8YSd9XjdW9dfXV6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTX4R-003k08-1I;
	Wed, 09 Aug 2023 00:29:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTX4N-003jzN-1q;
	Wed, 09 Aug 2023 00:29:01 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A4E9D20172;
	Wed,  9 Aug 2023 08:28:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1691540937;
	bh=KZQz3C4EK4svAfJjrGrSxyQuWjZmE8LD+H2VcJuXgmw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mysbv6IrcmrKmUowjZT/O2GUGqDVxT2o6q6SlMAcaEHU1AO3oOjGvWPAghvq46qaV
	 th8Crr7ZRgElbViQb5onYGUT4EF6Yqf2K+I53cUZm5hsl57VLJts7j31c8z/v06dJ+
	 iCwzbAPABRShFTXcl9mcvn9C7/XmP2JFtP42tDO5vshiFl+IH3qoU30wjWudyhohH7
	 9T/WnvEyKDUx0byTCfVtXeYi9YNzhvhBQp7pjOUKX2xLKZAa5IhXlGxUIuqz72MzIk
	 zvkcNAQe/fhEgB8Bf0jyot7zH7yOd4IEA8O0B9C7+OrWXKAGbWuLrXXQKwR2MVWJRC
	 7IeEXWzNBMdyA==
Message-ID: <a670192024911f7f2d676e245f5f240e9ed5126b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, alexandre.belloni@bootlin.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  joel@jms.id.au, andrew@aj.id.au, p.zabel@pengutronix.de, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Date: Wed, 09 Aug 2023 08:28:57 +0800
In-Reply-To: <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
	 <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_172859_815443_2D0FC791 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Dylan,

> - with no changes needed to any bindings. I haven't needed any other
> resets; are there per-controller resets specified in the HW docs you
> have?

... keeping in mind the reset control that the aspeed SCU driver
already provides for you, when you enable the appropriate clock gate:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-aspeed.c#n224

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
