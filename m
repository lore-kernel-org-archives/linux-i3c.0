Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D808C1B087
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVX38OzyB8buiIktVdALjdZvLPNO7X5PMsyOM4l0Ik4=; b=s4wHvsUr0ghOzW
	URpnsBX+5keVKeKMUi4cMX4n/OKXQQMw33DSatdsIJ0+NyeAPV9YBG8UWsZtLpmu2yRNysrcnKbsd
	atoT8j99NrMXZdbtlqapp047QfIJwlGOWy7nIw0ws1Iexxo0GWoO42ubdfbfmKRMAB28+xSiUe8lu
	2vi7bzSe8AtZ5Cw9rn0dALL5W/wVaKKKqhc8BFGAixv8xl73IcM4O4Po7WvOpxQ8VqMhB2leYR7wC
	pL5SOnIz6gDvpjLSQTS2rMFZiDGYzGdzS5gPIoCx9YdeWgK/a7UC2p3W0ONDw9W3FubzyU54wMQ+G
	O8h4YzXslxNREmmSB7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0J-00000006Rcp-3bGk;
	Thu, 27 Feb 2025 06:04:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWxw-00000006R7H-1l7z
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:01:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22328dca22fso7467565ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636107; x=1741240907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=AxQUHYv3wZZNyDnWrp+PCmH5+5ZEdH1Ve3L9zCNUbSjZteF17NPK7IjgJ7MCc0kUuC
         vvN7j9zHMKH9KhxpzUUKHgnZxewdSU22Z5ON6+x5va3vKi2W+sQgLCpoJQQLQ6cImaPS
         UpZEe6HBC/a+ZqwcWh0czox8/cAAMAwXgHE24nP9R74h3RG1JM0KtzlvnQK55JKpdCZi
         vu7VRSmb61eG0k0468bTSCGCrpmQZsd873PW8eovLeFZVRvzJpl0G6WpwRLMjPl40KeN
         /oLAm83kJfHkXGUAcFnIYgzeQNtcH/JJ1XwcNT4rbkuAW+ap7phS2vGUomYarn4yCeYh
         +4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636107; x=1741240907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=U5iTK4vpoPmIRN+OwrnfY0jzIz+18ikAse5ELUMPhmCzSiPgTLihog9tQBhT8PgeWf
         kkVMShLO5iZtg/C0CYVzI6I0sACeGHPl8HQDQFcD2cmIowf0uPjl52NeE9iNQqCzDwQt
         FqUIlFxREINTJwnmC+hVyKZnG82CIZ4uhdOItPH2A8qaiF4gb8SVn1CkfiaXiaMS5Z8v
         I2bgTnPk9QvVgzEQMbXtsA2CvjqaaEDkd2pw8Rr+zXvqriuvkH99TEHy9X/aCuzRgDpq
         DnElJAUx95g1/zMOpMM6d07tpMRzvbtZG2Cbd7YshsjfsolE+zooKxu68GNdcmHvl1Mj
         SbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwbiJdyFQKrD/b9TxD3NGgaytkQB24FnO6/EUsVsQPWDSmXM6Fpvdmf25ZQW1wxaiTfzFX4Jbkwn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyILmSFkFZu1hZ6XYGwggKBprBxnZns0iEnCY1MpDo+axYyfdCW
	plYQAznzYmTc3pjPmvEDxBQkXPUjKMkqDS/MTf9g0hO5cQhozFbt
X-Gm-Gg: ASbGncslVIEI5HnVagT3n2JTCNMf33uDwQKhw0goxAMknORyj6LGIKM3hzSkpay14aj
	uQRkDEV+m1PYif8wMxCd0JzbQeWULYuBUjMSsWr3Mtuw/lRsIIIKjh275SoG7wOLdvSQ+ZPyMFw
	iEGFE+oJI6LsTlX7bqOw3iuNslXq4YYqbqpL3bnhslqVndnUKJOATV5lF9uS7FrebviF6vZXevw
	8qVBz4Co8irIcLUfN0cY5s2AdYSnnxupqDxZIb5aOeWrRNV2iRc0F7KoVFFGTe4vlr4z5rcZAE9
	lj7ZA+iKPvsvCTW77gv80fV6dHXcGVgj13+G
X-Google-Smtp-Source: AGHT+IFUBTM3E9ZUTYM/b7On4JzvSLZbPDNefBic4lp+FqFMQP4Iebm5RLt6/QZBY9X9G7Gd7D0Cdw==
X-Received: by 2002:a17:902:d4cc:b0:215:a04a:89d5 with SMTP id d9443c01a7336-22307b33034mr151602275ad.2.1740636107465;
        Wed, 26 Feb 2025 22:01:47 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:47 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Thu, 27 Feb 2025 14:01:27 +0800
Message-Id: <20250227060131.2206860-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227060131.2206860-1-yschu@nuvoton.com>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220148_456525_53AA394C 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Stanley Chu <yschu@nuvoton.com>

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Need to add a new compatible string to distinguish between different
hardware versions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index c56ff77677f1..4fbdcdac0aee 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: silvaco,i3c-master-v1
+    enum:
+      - nuvoton,npcm845-i3c
+      - silvaco,i3c-master-v1
 
   reg:
     maxItems: 1
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
