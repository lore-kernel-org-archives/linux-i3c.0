Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23816C74A5B
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Mar 2023 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFW1qSU3wtIWFiLrBCJmzdX4KAgHVeSzVfq7S7VxPTs=; b=HljDea083W29ol
	ysxHKcG3rxVix9NO3QpnydE9JALSq08G6JHOvccOzGDdVQv7o3j2oK+KQ0dXxIn92Y5ydRzC3+lwy
	YukQzbqEDGUIJ7VgkXDeX/oF7uC62IbTnWLHplfTO5l5iv0ccJ8pBIjxzIpxbpmuGNo+EpQ9MRM53
	2EQsbnYTJDqzOpqE/hQ16yE6J84fEnv+sDIxWTXynl3OzBZCei4vvl34ogHJIgNWvrSTLFHK84oxe
	XHyDJZ2Ie7CVX0jQVSIoXqOCCA/LMYkS0PuRVHdOYH9BIdpp1xrczTc7/ztJnBURNwjoSQI7X6Rec
	dZYnP2DNY4pvN+p1/mXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peggV-00DLYV-0Q;
	Tue, 21 Mar 2023 18:26:11 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peggR-00DLXY-0Z
	for linux-i3c@lists.infradead.org;
	Tue, 21 Mar 2023 18:26:09 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BFF6C240002;
	Tue, 21 Mar 2023 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679423161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fx26ObpfmO+Nvjh6CF0t7xZdagF88q4yUgAU3nZ5jzA=;
	b=Aj4HTSl8HITki1X9DB1cG/8gbrS1nB4u56KLlhNESQdrVVx+kVLi29Rc63o59KpxUyvaF3
	GUcVomXR9LW9K76/NruuftjcI0meWab+E8XYzHCKV7WojV0UjjakAhaPZNkjHWRel8O0RI
	lpu8JqQL1GYhnWACU/HuCjh8AhNNnb4KuHeqKKTj4hQO/rLnnvRv1B5jy5hvR5TkO4OMH6
	p2XFXox2tKp1NgtqNV4KiVYdkVzThk1ung6sM1HWlRkn3cZJLVggAG4PeBBdzpBCxS6iAI
	v0UmMmFBGdDZ3nLG2mcG67/6nEBd5VBeUU//SgIwy0QjYBLwrZ+YKrR1YY42nQ==
Date: Tue, 21 Mar 2023 19:25:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-i3c@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] i3c: Convert to platform remove callback returning
 void
Message-ID: <167942314076.665758.1395808956282122327.b4-ty@bootlin.com>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_112607_376618_CB264DC7 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


On Sun, 19 Mar 2023 00:33:06 +0100, Uwe Kleine-K=F6nig wrote:
> this series adapts the platform drivers below drivers/i3c to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
> =

> [...]

Applied, thanks!

[1/5] i3c: Make i3c_master_unregister() return void
      commit: 0f74f8b6675cc36d689abb4d9b3d75ab4049b7d7
[2/5] i3c: dw: Convert to platform remove callback returning void
      commit: 04b5f1be2673a035b0218c6e0369cfd1460d63a1
[3/5] i3c: cdns: Convert to platform remove callback returning void
      commit: 3f8ad583590f7bfeb3b8ee1ddd1cca5f7f9a5a75
[4/5] i3c: mipi-i3c-hci: Convert to platform remove callback returning void
      commit: f959ec617521bab177758b7c71b0d56a65615079
[5/5] i3c: svc: Convert to platform remove callback returning void
      commit: 2810f1de814adb7728b1068586bebcf733cf1992

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
