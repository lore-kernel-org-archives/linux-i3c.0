Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD051CA5FFC
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Oct 2026 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgZtchPDH6Gu87qohyAxHUeMJsbt9yDkhFWGGoMkyLw=; b=chbAyOfqycNfA9
	+FBpKeAR+S4V6k780v4L7NVwc+QEjh8TZ9JAIYL1gyiPFh/sV/jq2xEBKJtZeMJgMfo2kqTb5Byvy
	/mexjXYGMe/2vMqqc186u2/K/LuSqn37KcXHn0KNqEMrZmIcD8z88oEDw1YQTfeIbrmh66/u7FYuz
	IzCe2Kvepnry+Ou3yDNz+s3ns+LdPKOHLzWTtuVCd5+rSLCnXGwKf+8qFlKhc0eXgBZ9GhJSOw/aC
	BQ3f/RPtVnXlYqT/731uwR3pkO2A2xrOJz49HYp+FwHetiw76rWh5ZOZ+93p81uQEhNBgw3jii+8v
	PyzzyEK0RlvatHMAYsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrb-0000000GmW4-1eor;
	Mon, 05 Oct 2026 15:44:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrZ-0000000GmVh-3tTC
	for linux-i3c@lists.infradead.org;
	Mon, 05 Oct 2026 15:44:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3335F60514;
	Mon,  5 Oct 2026 15:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1147F1F00893;
	Mon,  5 Oct 2026 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215064;
	bh=DqDJogYpgQ3jah0rAOAnF+gLRYHGFjmYGPMIhElTFIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YKsy63/aDAey26QsfWa2amcXZhztspcU8MlsPcUvQ+jDf7xbzRxwODv440s7CJqSz
	 6v6FBABURMTxBZPtrmyAc6dgzznxyRMFMraMu1G5LWtLfV+t4dgOU/9AVEu7i5WsjL
	 L/xzdgBxtRPQrAIPVLiL4xvdEgb6M+3WfaUTjpbZv+Gz9E8pR2zL/KmpetFGlZjulr
	 tIniM6C7IOXZPFOgyH0kCRhB1pbm8LPiBVHHuu9TJ/kZEAzInRzMf3zdLYEX5rKMRr
	 GevrWdEb/gVfFaIulUb81yiCqNF4Sha/LmXmFPAAc0aJE/q6Nd5RB7IILH+29KQEgT
	 jLQ2jcFDOkDuA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset lines
Date: Mon,  5 Oct 2026 23:24:23 +0800
Message-ID: <20261005152425.25319-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
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

The Synopsys DesignWare I3C master controller can have multiple reset
lines, such as core reset, apb reset, and dma reset.

Update the DT binding documentation to increase maxItems for the resets
property to 2.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index dc7ee38001d6..6da7d90caa3e 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -12,6 +12,16 @@ maintainers:
 allOf:
   - $ref: i3c.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,agilex5-dw-i3c-master
+    then:
+      properties:
+        resets:
+          maxItems: 1
+
 properties:
   compatible:
     oneOf:
@@ -39,7 +49,7 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
