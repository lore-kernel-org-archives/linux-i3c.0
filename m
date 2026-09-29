Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18688C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUD8gmRu2+0VQUZBJTAFasf27jHvnNs2pbxamGvNBVM=; b=K+IumfLilszgCl
	b79ipcZ8Ukbem5gQTCiAhjsbwLVKt9PbmpqkixFVXcQHSS/0isXaXz2IwRRoRgqkbU9pnAbHNxDaP
	DK8wnEruS5Enq7U3/4jyclvRYsHfHG+IODQcD2NmkiqGca0Rfyznpj4+laCffQT8ExPmcNQZqZaEU
	2SCQoqBmd3UOH6o7UhFk7c/H97VMS2Kh7VH384R8NFMW2uyXC65HYTu6dEnTSHXEZt6z+RKdf2JTH
	fEdRh/p/A7RSkGnUNyjkYI/ag7v9EkrMXybLfsy1geZf6lU4XeAq13Xhqk4xqcX/DjHK33CjAcVGJ
	ZzDoZ3EO6bFk309s8HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQp-00000002T1M-3HOl;
	Tue, 29 Sep 2026 06:35:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQe-00000002Ssv-014e;
	Tue, 29 Sep 2026 06:35:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7281260A65;
	Tue, 29 Sep 2026 06:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE191F00893;
	Tue, 29 Sep 2026 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663703;
	bh=AqkLOG6vp6Vsh99YJdEMgsfkLHRJ2+yxOnHunFY/tzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Iw+NfNvNfng8RYycBeEcqjiCQkvCeOLe+H5W5jTqtMfVpx/8AC3ZXwaKuEHko+Rbl
	 +eZGIwiw+YuXBxHjwgCCfRSyUkh0yifA794BkxAj6XF6FEQei+kebchAauNGyqg8N5
	 65MtUbVO/LLBm/GlnM3rsyFWrOo6M/Mr9w7jIcMah7kcAxea9QFa90dAmWx+UVTG4t
	 ysqrbFmadMlHUDWm/uhjlzjl8/uFUXyT1bd3t5NdVye9esKVdA8x75WGB/IFyUTETS
	 gTTC4I8QDdGBOfINagsOgi3Dc1lRZYeKYsKcLcFaczuM97gVDdoyCBW+yazmXQ0s1F
	 3YkDLa7fmTuvQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/20] arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
Date: Tue, 29 Sep 2026 14:14:04 +0800
Message-ID: <20260929061417.20733-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Extend ARCH_BERLIN to cover Synaptics arm64 SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..1c0747555a57 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -108,13 +108,13 @@ config ARCH_BRCMSTB
 endif
 
 config ARCH_BERLIN
-	bool "Marvell Berlin SoC Family"
+	bool "Synaptics/Marvell Berlin SoC Family"
 	select DW_APB_ICTL
 	select DW_APB_TIMER_OF
 	select GPIOLIB
 	select PINCTRL
 	help
-	  This enables support for Marvell Berlin SoC Family
+	  This enables support for Synaptics SoCs or Marvell Berlin SoC Family
 
 config ARCH_BITMAIN
 	bool "Bitmain SoC Platforms"
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
