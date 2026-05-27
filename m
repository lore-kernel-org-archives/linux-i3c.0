Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64293CD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZtWLuC3DSNOaia1rK9DOzB2ChGpqE8rvgp2n8VO5F8=; b=c4LC1hGlKWeQRy
	VTNMyUfPdkWApJLOvpldneuR4G8bpcW1IEmgpNNCdxFnGYYp8y9w3RB5iO2vEZMDJ+rsilZpwXQwG
	Fa8efErYxby553ZtKm7sptNDI3/VAoSnOz4h5u6BqwbnYxZW0z+EfcNR/PxI7zuhZzBkPlm414hrP
	VBTxaSNkP5xfoBQPYOZFQVSqbhnxThotcyQ2cJVqtodXe9Oy6w2B95WAP4s+VO4dK42Dv4LpEA6La
	uYohyPBsb/pH7855zmIWWGsyIcSKInnulfsAQqc89SFdTG62vt3IX11hfb41FoDDIBXuZtDKK7f5c
	GAlaGiHaf2e+7TaXpV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIIs-00000004b1J-2mPw;
	Wed, 27 May 2026 17:44:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIIq-00000004b0v-2FVm
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 17:44:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B53346055F;
	Wed, 27 May 2026 17:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA8A1F00A3E;
	Wed, 27 May 2026 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779903863;
	bh=6B9xzgU2pTy5d7erAUiU8+jBUfUEPQfIsmj5Loun5dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U4tB+N6IxaYs1P8N5bKQRrJvB/5E9gcFnRBWqVzXhjt4L1m7ohJvZpv6z+buEEqBa
	 RLnlWOGltZ3/oJI/y2kjToNrUWSq418Duz5mNs2WO+B/fSuj8IN596xHQnDS8Zh6GU
	 CZ+XeZ4ze8ZI2zUDMNt+m6n7OHIbq+k7w7yXjDBNdW2NEg/9D0uIABv7uc6vHKXWJD
	 XAh2sgP4YRPYzi/8sNsqCzIX0mZ1mt/hXtht/9/eB1r9IYGgmuQYcggAfd/CE21w71
	 ORLd9ftXtN1VM/xIXijVPwWG+h5TKZ9DParB4uF9BNJPcgINZqAdE3fRm4mMYfqY99
	 WUHzsy3/3cH/g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-i3c@lists.infradead.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	adrian.ho.yin.ng@altera.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com
Subject: [PATCHv2 2/2] arm64: dts: socfpga: agilex5: popuplate reset properties for I3C
Date: Wed, 27 May 2026 12:42:20 -0500
Message-ID: <20260527174221.79259-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260527174221.79259-1-dinguyen@kernel.org>
References: <20260527174221.79259-1-dinguyen@kernel.org>
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

The I3C nodes are missing the resets and reset-name properties that are
needed to bring the IP out of reset.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: add reset-names, remove reset property for NAND
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60eed..fc169b869443b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -244,6 +244,8 @@ i3c0: i3c@10da0000 {
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C0_RESET>;
+			reset-names = "core_rst";
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
@@ -255,6 +257,8 @@ i3c1: i3c@10da1000 {
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C1_RESET>;
+			reset-names = "core_rst";
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
-- 
2.42.0.411.g813d9a9188


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
