Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E668CAC591
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zzwQuCprHtbHMoxX9OUTE237XidKvdIfAEy87TSNV8w=; b=FHUWnjuOVKV3lO
	hBc0q0rfKonWphzuIkkGNftumNrtes+HztdpDQPbpc/ao2lm9c+mEJX+Za7x99VVllsedZBZvPYXd
	3XmBOl4bA+Drt3WuFGr0gLR/VS9iM5OgagBWHYntN72GF/2jcoLXGDTZA7inpNHxWkQUUw8/WvcaG
	q/gs2QPdrwX8r4VVgTMj7cXnrhvx3iHURBc4/U1qaihRx4YAUADj7UdL4rZkjm8iDTEgYBkRKf4Ba
	U44Woazovc2UhcZWk3LFydW+qHdLx+1kQQUohmGoPdG220nxiNgD/gCnkCBVJlomFIHt5FPTGeupJ
	QosuX54+v3wN5niz7/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vA-00000008mfv-2mu7;
	Tue, 09 Sep 2025 17:14:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwII-00000006e7O-3dIJ
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 11:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757416430; x=1788952430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0ojkiu3LfQAusXQqUYO2jlEDA17fl5Xon6kU9JbICmo=;
  b=jdOmQc1al+9GRW9WZbbdkHMZ0HdSzEyLPULTvbzPMIp4AzfB3E4DEe76
   umCdXa+avU0MWGw3tniBZ5ZV6n/noWjoZEFiKzcp4wpb7PUCmo3FdxO5b
   mEku64hK223PxAd5wtWW7ibSKUZA/wuNRJWMAWZAyAJPdyS/FuSVOXX2u
   I79UvcudLmqciDVVjMj6yI3YtxoBYs2y12akQYp8/shxxSrHK/IkFY2Ye
   FfjEqSZ9XuZsTXlH/IeZ91k7ztKKTmfijLMyirJm510dleAeoyLmlAwU6
   8ZJ1nR0zKvZ7AuI1vikxddmNWMtTAloHoYgo4WVYHWvosU4HxF3LmGrI8
   A==;
X-CSE-ConnectionGUID: ZGUz5jXARtSkPAk99cBbrA==
X-CSE-MsgGUID: LH0BhHuDTieEvuGypU0jKA==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="46810482"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 04:13:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 04:13:44 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 04:13:38 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 0/4] Add Microchip I3C controller
Date: Tue, 9 Sep 2025 16:43:29 +0530
Message-ID: <20250909111333.170016-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041351_186246_3F66CA8F 
X-CRM114-Status: GOOD (  11.86  )
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

Add support for microchip SAMA7D65 I3C HCI master only IP. This
hardware is an instance of the MIPI I3C HCI Controller implementing
version 1.0 specification. This driver adds platform-specific
support for SAMA7D65 SoC.

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus). It also
supports IBI mechanism.
    
Features tested and supported :
	Standard CCC commands.
       	I3C SDR mode private transfers in PIO mode.
       	I2C transfers in PIO mode.
       	Pure bus mode and mixed bus mode.

Testing done:
With this patch we are able to fully configure the lsm6dso I3C slave
device. Unlike I2C, I hope there is no linux utility to check the
various transactions supported in the host controller. These features
will be added later on this driver after testing (probably with I3C
analyser KIT).

Durai Manickam KR (4):
  clk: at91: sama7d65: add peripheral clock for I3C
  i3c: master: add Microchip SAMA7D65 I3C HCI master driver
  ARM: configs: at91: sama7: Add SAMA7D65 I3C HCI master
  ARM: dts: microchip: add I3C controller

 arch/arm/boot/dts/microchip/sama7d65.dtsi    |   12 +
 arch/arm/configs/sama7_defconfig             |    2 +
 drivers/clk/at91/sama7d65.c                  |    5 +-
 drivers/i3c/master/Kconfig                   |   14 +
 drivers/i3c/master/Makefile                  |    1 +
 drivers/i3c/master/sama7d65-i3c-hci-master.c | 2705 ++++++++++++++++++
 6 files changed, 2737 insertions(+), 2 deletions(-)
 create mode 100644 drivers/i3c/master/sama7d65-i3c-hci-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
