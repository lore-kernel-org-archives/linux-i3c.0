Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB3DC282D3
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 04:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVX38OzyB8buiIktVdALjdZvLPNO7X5PMsyOM4l0Ik4=; b=W0oDya2vqNhvNZ
	GD/uLtX8jDv+yfa8WJrpsTj6NAIx/o0aowkQHizWQfCjIBs9MiMBPiNTEmAO0qx0gN/JEGkJk+gnM
	mrhLbhFrsf9J4xOmq4i50d4r6DeeFIoJpya2uj6rLyCbPz0MGjtOFI5Th/phDUzuCAfHzTcSNdKZc
	WgJN9rkNY9/9vktgGlU0WXZYfm4omVL/C5516O7cRD/daD1VGi+lJOpwVq8L/rzqge2itFuYbwgGO
	4nffbhS3Ytu0I6ZV8iLHprLh1grkcavBl0/Xc+gFpX8mrNzzhWpBCkKQ0t0c9kSw+DBYvNA5ZMrMT
	/1COevkVeDu3qEpExagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgcm-00000006yjU-1gkb;
	Wed, 05 Mar 2025 04:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfga-00000006typ-3MG3
	for linux-i3c@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=; b=g+xN3bJ/pi8ovCQlkK3QV2j0+D
	/JUA/JPHsYGmbNyRAl/7raShMpc09dzGWktiTQ6dWwktNAuvfivJFutmZ5ArFItDVFK4zyNiJaqpu
	+oJvCtZ1+tMuqUuWMKzrQsQ/LFHyunTD/sh7LcOEYe2dB2hlskUnOzc9FeP1biAOX/fWXuGpzuXWe
	+oczCn7MyviRU6S38ey6XATzbIcA2M/g08VRRMCimPfSwO8ZpwbflJ940p8tDvrELu5iX1zuDsEri
	qx/7Co6hROmH/6kmGxy9jcp9OOTq0CNUYLIIZ4mEtMdY+Fb0Cg67eCUByi+VClYgLqlT6gfQ0ud6B
	QH9coMxw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgX-00000000LUg-2PdO
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2234daaf269so104128905ad.3
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146280; x=1741751080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=KWfT9ZyE1CZaM6WCAwwr3vnzYKM3XNnkVRtuIQ7JeaTyyDrAO/sMZm1BAy7KLVyFk+
         OpShbC6bOI+arXOVzz2G3+ih/w5p867UYw2L3fMHR4dBMoqTMQm6soaJZXd9CNJS9ZCt
         BosjOAd01eUl1xBiVtw8oAzA1cVbZkOhWwrlO20+6JQZPNNENcuh0EiuuSRiaifzCE62
         Ner3IPuLvMMdaP0ke4ByAaGAnYiL9u2qiXCSMsUdxpneMF1uw+PvjD1biWX60YgKp/BK
         vIkPuf24DCwJ29XbP4PnOAmVO8Qj6+eCDMws7gGqiWCg2NlYAfkE0o+/Wq7exQbmAbrd
         HK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146280; x=1741751080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=WroU95yvdqCy7pmTgEiJ+D4TYF5z0xXpt8/vaZf6bhxlLnJE7mAc6XvNxPjPnAyoQu
         HdbHdLkZNspm/ogBuH3rJpzpPBpU2h1YvOHXv4bT+zBI0zO76j4wjPqIcDpx5Kf310VU
         mdCZdUx4qf+INpPGJQ9DwBbQ6Z4Y/RQBpFvA3q3bgCsLZm6saIfmJD9jw3J0nGuY7VRV
         agcFNf01U1bIkbdQclCf6jyXlaQze/0OJZGyFIV10myokjjxOY4tFEUD7JE1pvbOggZ0
         7JqkRdZhFq9l9O0eT9T/KAxOIYx3eVPogaB1Y0f1uw/99C4Ej+bThDsp22ZToiBdePW4
         w4bA==
X-Forwarded-Encrypted: i=1; AJvYcCU1cOuRYta1L+TUTAMCysmK5jnBoTDrpjKEfnjS6ArE3K1zzbCA9dI36ol5crTY/O6yM9ouxLv0yU4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIj9dJf4P/1V3xCBxRIx4EOvj/0hxbklvAmK/19jVzB9duAf76
	PAi8k8b7UcZ6s6EZUksxYJppz8SM0HTao96RcTBbshURU3Fdt0VT
X-Gm-Gg: ASbGncvDeO/p2BpisGMJxC7++ZBv6hT4xT07+yGHPIPvDwa4ZjkYfOSk62JojEsGyT3
	zhwMYqmwUbdbIG6y/8VM5rkS79HVugIOjLWh7T56sXsZnBXak2TRpJ7xAaszu3HS/YQ66Eyj1fa
	jEG2uLDcqgERi0u5iWeShD+rbnTVQQRa+djk0BA/blap6sFeNCNSDO3ozWIAHo79DAA3wmAcQ5e
	AydkE18jQJa1lwrxIqTsRgRW+jAx6U4k4o/WKZS7HHJI9XqvU3owjNvJNGWvVnEPLS1Vb8ihkuL
	fhVh0esFpmLWI2skgO5viIODKRDRujxKF3t5XzjSW9lXuI82V/53K4A=
X-Google-Smtp-Source: AGHT+IEtVqtQQnVo8PHaSXN1K3Sc2Cf8P+sKm3QdUVwoE0JuCrOF0cXwevOrjax0u+LApJLfkKso+w==
X-Received: by 2002:a17:902:ec82:b0:223:5c33:56a8 with SMTP id d9443c01a7336-223f1d26109mr25099565ad.35.1741146280016;
        Tue, 04 Mar 2025 19:44:40 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:39 -0800 (PST)
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
Subject: [PATCH v6 1/5] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Wed,  5 Mar 2025 11:44:10 +0800
Message-Id: <20250305034414.2246870-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305034414.2246870-1-yschu@nuvoton.com>
References: <20250305034414.2246870-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034441_996814_38847C3F 
X-CRM114-Status: UNSURE (   9.62  )
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
