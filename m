Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAE4C10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895D520857
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSCf6fJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895D520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8erK2SfFo3NQUlBm/TjDc0sIBNlwIMGW4G78Ge9tqiw=; b=iSCf6fJ3kLIgzD
	p8ZYkp6DWxIe2NEOCRGP+6SWViwFgduwjWWtWaGYAe3vqf2AxnJAXoQcOBDfM1Fp55kO0oTb6TUVJ
	l+3BpPHi2dNhnDroveKTT8PpzAPs1kPdGI0/MYQTAJ/S2/Ol6dapesd9TjjUYCehB7B26/Fvlazyq
	JHccTygw0MfzB/JlGK6MbWMXgyHynSUjaBRfQQg85mcPQZyhKY02xxhwEUnsMB3tZ93DJrYRFubtT
	JUy8ayqQA8Id3KtAVo3z3vawF+JUnAexwl/2oT5TMfWeO8T+zwC3GPN4rhvCJWKgtijrnGTUAHrot
	6vgPYCTiyUkWc1vlewHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGIgA-0005jj-66; Tue, 16 Apr 2019 07:38:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGIg6-0005cj-4x
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 07:38:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 44C18260678;
 Tue, 16 Apr 2019 08:38:48 +0100 (BST)
Date: Tue, 16 Apr 2019 09:38:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v5 1/2] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190416093845.66a713fb@collabora.com>
In-Reply-To: <20190416073148.14534-2-pgaj@cadence.com>
References: <20190416073148.14534-1-pgaj@cadence.com>
 <20190416073148.14534-2-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_003850_566185_C7B81409 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 16 Apr 2019 08:31:47 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch dropps support for I2C devices with 10 bit addressing. When I2C

	     ^drops

> device with 10 bit address is defined in DT, I3C master registration fails.
> 
> Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
> removed.
> 
> Because this patch series dropped support for 10 bit I2C devices, support is
> also dropped in Cadence I3C master driver and Synopsys DesignWare I3C master
> driver.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
