Return-Path: <SRS0=IOfj=OV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD91C65BAF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Dec 2018 15:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38B02086D
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Dec 2018 15:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bb24VVAB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFVhczhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38B02086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6jcw5h293CXwlbC13H9+zN+dA/LVLfyJCA9oGW03tQ=; b=bb24VVABCx0DrF
	eAfCrhm/6t8U2dE4+5cvNzv79Px8xwfnElJ+mCowcfZ7Zw1RuAjy0+HrLQZvetcTUkQdQm/We8COB
	MEV5xm+qjp9mH0aN9dM0wp0RD0BCcKR0syUuJAlbEpqeldM5SY/rYS68yvzp1zzbkyHnsoIQEW3ke
	WjBemiqQfd1Vy5/W5zGeLdlGcZblU4Ycek21Nqegz938iHe9Fa8YBOKJbauzPXqyrxPAHZ26mxUXS
	NfM5H5tZQAA8Tkw1uL4alJRk8y5TbFheZgTE5YrnOtY5arlhYcnHVtrgTLUuakAb4agy2/O6WwxwI
	PmdRPalTJZogfQiZxLIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gX6qM-0004dA-II; Wed, 12 Dec 2018 15:54:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX6qJ-0004ch-Pq
 for linux-i3c@lists.infradead.org; Wed, 12 Dec 2018 15:54:37 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A01482084E;
 Wed, 12 Dec 2018 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544630064;
 bh=4vsGlT23c4Y58ffPUSYz4645uNfPFpgpJoOa8HjFoGk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VFVhczhB81fATb7rUQaN8LEqwobFs9SovdC3cQdVwQviCVNQx8RrWB30kNKXZmJAM
 umH/4ZrI4WeMq/rK7C980MZ9YCATS0EwCRajAo3XWhuXB0XMWqWXLASdRxc6K3h6fJ
 1LPjiXigdDHAX95g6HsKo47KlxeU7bIOXJgdWNVs=
Date: Wed, 12 Dec 2018 16:54:20 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: linux-i3c <linux-i3c@lists.infradead.org>
Subject: Re: [ANNOUNCE] Creation of the linux-i3c mailing list
Message-ID: <20181212165420.2ea17eb9@bbrezillon>
In-Reply-To: <20181205172048.4bc4d44c@bbrezillon>
References: <20181205172048.4bc4d44c@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_075435_852889_F6681C87 
X-CRM114-Status: UNSURE (   6.48  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>,
 Mike Shettel <mshettel@codeaurora.org>, Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 5 Dec 2018 17:20:48 +0100
Boris Brezillon <bbrezillon@kernel.org> wrote:

> The I3C mailing has been created on infradead. Please use it instead of
> Cc-ing linux-i2c on your future I3C-related contributions. I'll update
> the MAINTAINERS file accordingly.

Patchwork instance is available here [1], and I also asked Konstantin
to add a lore.kernel.org archive [2].
I think we're all set up now.

[1]https://patchwork.kernel.org/project/linux-i3c/list/
[2]https://lore.kernel.org/linux-i3c/

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
