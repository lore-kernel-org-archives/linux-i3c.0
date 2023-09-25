Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7467CE79A1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elbOBNHEPNFxWKSGNYkprjA8wjjHM4lGGxN3JOGk6Fo=; b=rsaqcHRS5G422/
	tb6XcsZ6DE2pqWc73Gn+2zA+hcuZn1WXh1hGoLuo1lkZZ4oPOK11WE9HbVcIIbIthz7cdlZsrejr5
	HqLVP3YbHQD83tF7WgmHGcDZsLNC1hTEKdODt+DZrwap0Q/zYhJqW1NJT8/7Zk13VgnC9/31gag9Y
	VSwgDXlx65RipRCNH6mBz5P5KZilLL8T7uu+Y7xcVuOzvETqcVBNQkHatebYpeh9IIctDv42W5Zn4
	RW/Ng9iXRioifW5IHzXDyVv4mo9ZIL5mLQXDQ2m7n14OZj2i4fvg3/vfs5bqES3GdYrQepJHyv0s6
	wOmRYnO7+OWWZsJBHPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktFg-00F4Kn-0q;
	Mon, 25 Sep 2023 21:36:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktFc-00F4KF-2n
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:36:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEF2AFF802;
	Mon, 25 Sep 2023 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o17xFITY4/tplzqCc9+CZ0IkAV4pFuD/dockO/Ut+E8=;
	b=mTddVZws4wQoq4B0GXpIXKGUD6O+D8CiJ5TmrWB2quFdC5V4CdC4W10wYEa7GCNtoeAXuV
	vI79QPSDwTZFW1S/fJ+hlqMl/IZQ916o17qWLPipU0pGGwz/otcDGG2HA6Ta9ZTmEQMhRh
	TYz1HMDmAMfxU02NFRhQ6ImeS3HbcmDP00GPCCUveYKBg5VdjA5sRCTiu3krxxMO9IE5xD
	UOIl/OOLw/P+nrdb9GYuTPZz1z1DOYF53pBYujXdABzyRVjb/fWTMf+2BlWxk0KJ+D02kJ
	eFynX1JGLy06nzcajcBTRFHYnxFlpGvcKq+gCLftCnaYRm9AcUDzMO63pFWdVw==
Date: Mon, 25 Sep 2023 23:36:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [PATCH 00/12] i3c: mipi-i3c-hci: Enabling fixes
Message-ID: <169567773740.243402.12753246943609556153.b4-ty@bootlin.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143621_074089_F8E4A584 
X-CRM114-Status: GOOD (  11.17  )
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


On Thu, 21 Sep 2023 08:56:52 +0300, Jarkko Nikula wrote:
> I've been hacking with an early MIPI I3C HCI version compatible
> controller on our development HW. Basically a glue code registering the
> "mipi-i3c-hci" platform device with some additional code for logic on top
> of MIPI I3C HCI.
> 
> This early MIPI I3C HCI version won't be productized and the glue code
> won't be released in near future but I believe these patches might
> benefit others who may be also enabling the MIPI I3C HCI on their HW.
> 
> [...]

Applied, thanks!

[01/12] i3c: master: Inherit DMA masks and parameters from parent device
        commit: 0c35691551387e060e6ae7a6652b4101270c73cf
[02/12] i3c: mipi-i3c-hci: Add MODULE_ALIAS
        commit: f656f6bd22d7cd08b55c6495fcfaa391c2eb933f
[03/12] i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes
        commit: 0676bfebf5766f0a60549f74ba597115028fa39c
[04/12] i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
        commit: 45a832f989e520095429589d5b01b0c65da9b574
[05/12] i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
        commit: 361acacaf7c706223968c8186f0d3b6e214e7403
[06/12] i3c: mipi-i3c-hci: Set ring start request together with enable
        commit: e141db842766b1d9af32030a842ceb5eaf389bbb
[07/12] i3c: mipi-i3c-hci: Fix race between bus cleanup and interrupt
        commit: 4e40642cdb621c669507d7ef098c93ff98e8747c
[08/12] i3c: mipi-i3c-hci: Set number of SW enabled Ring Bundles earlier
        commit: 7ccd40edc1f5c43e3f1c7d209336d3981943ab63
[09/12] i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
        commit: b8806e0c939f168237593af0056c309bf31022b0
[10/12] i3c: mipi-i3c-hci: Fix missing xfer->completion in hci_cmd_v1_daa()
        commit: 4c36f656b7d1fc00643730c5845c19b3e15be856
[11/12] i3c: mipi-i3c-hci: Resume controller explicitly
        commit: 3521fa63c1ee7414e6ba0fdf98b82b07939147d9
[12/12] i3c: mipi-i3c-hci: Resume controller after aborted transfer
        commit: fc9176e794d74baccb1e4ef41894ac141f524992

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
