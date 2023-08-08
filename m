Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC112C001E0
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHcCDiHwMyYaJxsb+QC1RC8Lu6B1dhZE+Xv7TH7Hu8A=; b=1bDxsHudg1sRQe
	16ld0Kzz1A/2ZJ3f7XNFmAtrZbxjJFuUfpCpUkUqyKpbHzc5grMIiUhiYIJ24+UmpvRoTBqQhV4Tc
	Om6nwooBHhQ6koDxHNDL/m1qkLmNEqeg2xld+uGUQwF5wBBOhoxbmYdAkEtqcVbxwThxEmHkOjM2h
	ZStXJts++H00HEA/rQH7VkXvkqhlpoAV/lgLV7CsBWFpXKoFDUeFYAq8douyOgV8DgU/sudsVlm/3
	EUz/Z0ii484BXIAlLc73so1sFA5lev7UgTlzOgD+Skg6KJ67BUjLSdkKIpTOMpJ5pzCBRZR1UsJUH
	+mARtIm5ceoLISpaOcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlS-005znl-18;
	Wed, 09 Aug 2023 22:34:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOrE-002pVn-3A;
	Tue, 08 Aug 2023 15:42:54 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:44 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>, <kobedylan@gmail.com>
Subject: [PATCH 1/3] ARM: dts: pinctrl-aspeed-g6: Add I3C1 and I3C2 control pins
Date: Tue, 8 Aug 2023 23:42:39 +0800
Message-ID: <20230808154241.749641-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_084253_020035_5577EFE7 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 09 Aug 2023 15:34:49 -0700
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

Add pinctrl support for the I3C1 and I3C2 pins.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 7cd4f075e325..289668f051eb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -297,6 +297,16 @@ pinctrl_i2c9_default: i2c9_default {
 		groups = "I2C9";
 	};
 
+	pinctrl_i3c1_default: i3c1_default {
+		function = "I3C1";
+		groups = "I3C1";
+	};
+
+	pinctrl_i3c2_default: i3c2_default {
+		function = "I3C2";
+		groups = "I3C2";
+	};
+
 	pinctrl_i3c3_default: i3c3_default {
 		function = "I3C3";
 		groups = "I3C3";
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
