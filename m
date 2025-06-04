Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6EBC5B552
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BR6oh6llEjkXcV0cyHQ5ZHQwWorqdL7Qlot/r+HT4Pg=; b=pctvXvhzxXmfbn
	YwO9mSctaJ4lgpp70qRIIXAJEU6umleQj5mV2CMTJ3hyeyw4sg5Oy0VcEbOqPFOCmjuO9V5a8Iugy
	rpsA7SwfdDZnoIyBpxT0jBy5H+ZqOZEyh/IRZuFoyhQGjvpuiLDCnxy9HKjgmowv6tYndj++svDDy
	E7qgP6R1pIZLHSqeHXRc9NPWIEDJLF5cD6G60syBJdKWYumGDMaaRejYQGZ2asAnsWJQPeqtzYAXQ
	2G/801MWpj8W9+as+ZPY1Mzduk2h7ksI3HQtH4+5+yVx+lnWQb3FoONKyUMn39JALJmxRHknfl2Au
	Nk/ja1rKll4p8BmLuaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCq-0000000D77o-1zXe;
	Wed, 04 Jun 2025 10:18:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCl-0000000D73P-3Qcs
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 10:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=u/cBSgvybZqoNv
	0F8wSCxbActKREl9YM8Rj729Qsdww=; b=IW72XARO9Hh4cKEDK/yQbafMlgAtdE
	5fHXmI76kTHfwCnIsxG03NpSw1zcwIdWpxYbqOs/3PR716KAXoKYuc5x/f13q6dj
	tivo2pjdswolG4ZFR0sC6k5zrcYhribJL+24DM6Bi9aefV1BHhTDK23sbpUufh+o
	aYTI9mul0a3Ks87JvTNlxG47vEISQnAPIgJuaEEiNaOqh6tkwTT/oLoPuW/Vkk4A
	9nxq51OxFnnkaAhn+VLMfwHAkmvKwVdpUJQA6Y7iuhtlxZAcC69NCp+OxheiSBMZ
	QrmAtKf+CIsmqsrvxNLPVFXcVyb6zkZXbTqx+hdSW5Sb3t14y5Iz3mvg==
Received: (qmail 629158 invoked from network); 4 Jun 2025 12:18:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:36 +0200
X-UD-Smtp-Session: l3s3148p1@WCLjUbw2hqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH 0/4] i3c: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:26 +0200
Message-ID: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031844_485440_E26327A2 
X-CRM114-Status: UNSURE (   7.12  )
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

All I3C adapters so far use a timeout of 1 second for I2C transfers. I2C
adapters have their own timeout value which can be changed by userspace
if desired. Use it for I2C transfers. The default is 1Hz, so the default
behaviour is unchanged.

Found while finalizing the RFC for the upcoming Renesas I3C driver.
Looking forward to comments, tests...

Wolfram Sang (4):
  i3c: dw: use adapter timeout value for I2C transfers
  i3c: master: cdns: use adapter timeout value for I2C transfers
  i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
  i3c: master: svc: use adapter timeout value for I2C transfers

 drivers/i3c/master/dw-i3c-master.c     | 2 +-
 drivers/i3c/master/i3c-master-cdns.c   | 2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 drivers/i3c/master/svc-i3c-master.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
