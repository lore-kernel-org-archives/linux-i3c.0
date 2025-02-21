Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F9C021AA
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BD0pgIzkQz9ljgnrlAZ5kS6yXXF+QlF3NXolDNs6ck=; b=YeT/dDgTRo+fKm
	K8/2KhFfPgg9YNHZ3xpz+MRQdKF6oTdiLNSzy+a41EsKxj1kz/PMYszqJ/mcX0SVtPnxcj4aPD48s
	bRLQM00FEt+BkR9NsKaLOXx88aOSjvW91gRcDlr0xpJOr4/O/vbCeH2rSOFMrseD5LRjTG4q+W/ZK
	Dhr6220Jm9+K+NKhS5xwfcn+G9XooRgjI/R1G0kRbGp1/BuEsI+wY7hXd7vzpx/OZellvuIs0WBWK
	tPPnyC0nr91QenW0VbiFa10VwxHcfHvVLqpmgqYFGRaKCQcOhI5B6QANpbXrHwt8825IoOmLjLBV2
	cgjUdweFJJHIQT4yHNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdR-00000004ONc-1vN5;
	Fri, 21 Feb 2025 06:35:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdO-00000004OL6-2jEd
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220d398bea9so25705465ad.3
        for <linux-i3c@lists.infradead.org>; Thu, 20 Feb 2025 22:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119738; x=1740724538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwO/SkbYtwZTs4AM8sYV7gCvk2UZJpUu9dv4BdAdEOY=;
        b=a24/yv+iVdld2UTnmvON8nXdwGphLhabVEd7ZT8Sll/CRrZfXrsWth8UzClj6cZKRs
         2fma9TjALKftSufJnSzA0T3LMmDT8JxJCDk1FnoWu3+Sb/76bJ3nYEzAv6wK1ImdeLZE
         R3zwLTJc85UNy/7Dl5HRry+UmdfCcX2qN23zgQW0t+gZHaBKnbz6wHm1NnlKkCfi9T6i
         54yFP+2bRV555GISDxHHwb6r+r/xnp4/liEyHy2rOAXBJcBOMu1gKThF7vKEnLzFi25w
         6QxnbD+jQl135ICib8FMAv4VB0ejW7UfZCl1pPuG2XQQhZUfMe7T3wSuuKPdFc9j0mBh
         EdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119738; x=1740724538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwO/SkbYtwZTs4AM8sYV7gCvk2UZJpUu9dv4BdAdEOY=;
        b=KcSqAUZd+VPRUXLC49OJqFWrcytdgiAoD2kozSU20HbE4iM968bIF+aEuT0v9bWkcg
         c6uQ5WAL2yrrAZlZQxNYyDSJHfQJ2DYkBlLVG6Xwm4MkPIe11E7zhCoZDXl7/S51+JMa
         7qCtPUYqX8JKTmGXtRFgq+gAwy6I/X6oALzeCXNiSuzVLs/D/kDFpaUMovM6z2CZusxF
         NuoSnaqXpe/nhj4AwrcaLH1XnctQs6w6iMFFTfamxJbNWE18RG/FYw7AZP1BS8c40qAo
         tUw2MNCRvZ1Z3tGhWnVqq8Rjn7J2OErjYh67PqngxL62fuaB+v8Beq1xXf4C+7gcyxVp
         Qb6A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Q2ic0vAzUXzaNA94ZVLYxB2qMs9lyA6Bmocwep7dIGornVDG0Ju4vuW8HGpUJPZeq36dIkBXmtI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw09gpcKe/k46dNSkQo6sEd1JYVF/Ta5LpZ41VBoDQngOq2Ycfb
	YSZ4NrAj00f7+kjcH00IxIVWkTwxqK91uBWElj6byJmoxUdqkaKF
X-Gm-Gg: ASbGncvTBagoELu5vKCJJkndQJIs0j+FvWUqEd8okNlGbq3KsdFtyM1jgteMy6JNWWY
	TMBaKNerxB9flENffzYEVc/oCfBYBtlYqkjtVp1VnZFtwhoOYGmTxJdHGCkNMeLACg/7WYfU0QE
	qrWJqb7Egbf88mlB0oScJbpn44MQF0XGihddKP4ETkvniBldxFnPJPZNfuPsx2TSF6IKj89gaHY
	+tOR8frmgHKdVEE1VLLJifCQux6/W6hXxY/8/YnTz0cO5u0SrcvesRxqNKEB4aS03JN/i/9b5kd
	b9kivmnaJvKfVggcFVkqh96ac176ElEmf+P/
X-Google-Smtp-Source: AGHT+IF1irUoX48lK4y0HS1OgtbhNS+wWRgPDk7H704bIktSj2/k9kSPBlJNGGRV0ZdISZdA+3mOZg==
X-Received: by 2002:a05:6a20:c998:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-1eef5558f37mr3519911637.31.1740119737763;
        Thu, 20 Feb 2025 22:35:37 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dc68sm13777275a12.9.2025.02.20.22.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:37 -0800 (PST)
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
	yschu@nuvoton.com
Subject: [PATCH v3 1/4] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Fri, 21 Feb 2025 14:35:25 +0800
Message-Id: <20250221063528.1810007-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221063528.1810007-1-yschu@nuvoton.com>
References: <20250221063528.1810007-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223538_690719_41F142DA 
X-CRM114-Status: UNSURE (   9.35  )
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
