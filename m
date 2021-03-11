Return-Path: <SRS0=k3Xv=IJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C48C433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Mar 2021 23:41:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6390864F7C
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Mar 2021 23:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6390864F7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNFRPDnLLI8U3VqmK+0+EMGET7PQTRzJDVrCgN7Rfas=; b=rUuTxi6jH54m1ieoK1Ab89KPOb
	904aqFKoGSp0E+/Nm4RcF6P3ltTLruTwFArRRIEEjm4yWdWepI/az6XX5KHWaLQ0dSnaaCzQqJRon
	SHJ2tlKtvSbpS0T1xeN6xw6JldZjWsNDXz0XVCAISav3Y25+8aGTRwXGhpKaKYNFymZNmHSrEUmB8
	yDLnqOaXZNrTJzP9Fy8fu17NeSMrDxpFeQZK34Nif+ofdSiuBqksT+j3ePizUpWnYkcz1aTdFrOuu
	PplafFfFF0gkwtWm4YFX9F63qDdscwX8V6IfPX40AvfJ9jEWyKNK8mDi9kuVv4GTect3vRofkySF6
	VDgpFMrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKUvV-00AG4G-CC; Thu, 11 Mar 2021 23:41:09 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKUvN-00AG2y-DD
 for linux-i3c@lists.infradead.org; Thu, 11 Mar 2021 23:41:05 +0000
Received: by mail-io1-f42.google.com with SMTP id g27so23861099iox.2
 for <linux-i3c@lists.infradead.org>; Thu, 11 Mar 2021 15:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IFH0kTzeJg7A+iDC79WbeQk0xgfuMdi+7gcFmh2QEY=;
 b=oKxFyRGr5kcR45YvhJuOwPLGrDKyJSp9NgICdyQqZGw08+hH8CCgJOF8T0ynUMyy1i
 sJ8Jj7Y7n5afS/v7TUE9uptgA12dJXr+WBaJfnLMQ2yoDErxawEOPYVmFf3RHDq7ROSb
 LrqtPO5sW2mohylbbeJw9wq2t0THuSA1x15DjM7qakXIwLMkkS1R90BzwdkoWX4tE0JY
 Hi1PY8tZ9LFT6iquZL0wKtFlOTD0GNsw3ZGx4Huk+x1jUWLD33K+usYKRPUYjPNfUkPY
 0uNGB03pQvrPaSlg0SEjqYhdH8i4B6MpBvjUBpQULSpLDpwgwxyWxHUHvsQPCWboSbqq
 Y8RQ==
X-Gm-Message-State: AOAM5304ThYqHtxewQ50r0MkLB1eLyGHnIhxZ7V5BAR6vOdhA6Swwt0f
 4DzUueRzwEXBEcS03t8jNQ==
X-Google-Smtp-Source: ABdhPJwmJHUYmsW9PwM0xgZG/Iwb0eQRDgOcXhhwLpuheItXUTEktHP4fXHEOhhtx5XwpzsBXUB3gA==
X-Received: by 2002:a6b:d318:: with SMTP id s24mr8240183iob.89.1615506059863; 
 Thu, 11 Mar 2021 15:40:59 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id q20sm33139ilj.56.2021.03.11.15.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:40:59 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Culhane <conor.culhane@silvaco.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH] dt-bindings: i3c: Fix silvaco, i3c-master-v1 compatible string
Date: Thu, 11 Mar 2021 16:40:56 -0700
Message-Id: <20210311234056.1588751-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_234101_990773_65D46773 
X-CRM114-Status: GOOD (  10.06  )
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

The example for the Silvaco I3C master doesn't match the schema's
compatible string. Fix it.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index adb5165505aa..62f3ca66274f 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -49,7 +49,7 @@ additionalProperties: true
 examples:
   - |
     i3c-master@a0000000 {
-        compatible = "silvaco,i3c-master";
+        compatible = "silvaco,i3c-master-v1";
         clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
         clock-names = "pclk", "fast_clk", "slow_clk";
         interrupt-parent = <&gic>;
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
