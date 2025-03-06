Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73442C28B23
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVX38OzyB8buiIktVdALjdZvLPNO7X5PMsyOM4l0Ik4=; b=kycnaNDPvZ/J+f
	9dqmDMdgXC4goc7NEAbY/uIDiZ4Y2xpXfytCfp0LGpJB4qEjFOj6H4DlWonJi8ySxnmAu3pKejMc/
	DrNPsPaURhqIE10K6bwKw3q0Q/I+UnZofwRGQ+ixGfgR14wS5d4JnwqxqOpe5/fyyuaMYy91litYG
	ShG2S8JBdZbO8Wkm4xc3v4Ydjzgnf+/kv0EshVhq3d9VO/Kr9mAas4U7qjXWSp7pwB3pZVgUvNALl
	z+FOkG0IJ6O9mzhY5UehX8dlFWyGfpIBg7JD+6lXDmmxjgQ2XWmerqRteWKfsuSvlK5IN+fp7YReR
	Q124XT7f/dtBVHImatRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64x-0000000AGNA-0gZQ;
	Thu, 06 Mar 2025 07:55:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq640-0000000AGA6-1Q4L
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223fb0f619dso5594885ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247679; x=1741852479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=kWayCxKtJVIMUFpkfL23vBXhik8r4DkWTRz4EVd35RPqIZtFJKgmuMoLu1t+qQsaRo
         //pQQpqyjWDwuNjX3dixOQsLPjW1K4zQEi6ShI78tR3FxVzYHTUFQesxlCd/KBLSO5/q
         n0hop/z5/c3EvPyAtkv6p6emyPfOSsFfX+bVoM97oadD6jRODgVsiovrS9+x0F72dV5x
         yzBlJHf+z0EwKjtabMo1H3psi/qUPpBBF5ur0iqWeP0xXu4CEzIkk/73y6JngRnFd3YP
         9Bdiy3jta6mm8pAUGFozBX3fycsunbvKkmqbPaNTa8j26Cf+NHpB85AfvoSHmbSt/g0u
         NcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247679; x=1741852479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbBWp8Gpp+tRkxfYN3BsRLi83MVsRiY+awmccSWrlIQ=;
        b=fRL0b7jJp++ei67SCgNn2jkdan9ExsaphXxez2zF6WibQjfTTmTg1IegR1wKSm2oea
         VmWd9oWLAexCiucc93CcIGHbI7xCQRM7ejXyM6K+zyshQgtSRrQrLPg/XuwDiLe5QfTk
         DEoQTYuMDH29xfSmzrNnApkiQ42rbawY+3MPNVSugM0oUlUG1ozaMjAhGlkvKNJXrVy2
         eyk6thZh9Y3dRFVF85oAEssCTQmJMdzgQhmUJ6ARUd4MndVOMct4IazIx3KTIQhY2EKu
         4pGjLhLeig6qkVCwrY5NdKqBTPoza77c4I/np59LBFG0u465LNgrFheE1wKHU9S+62ho
         Sn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKZ5dENO4xwY/9lOuBdNu6cJLwtm4S9HpNZbtlk7uPQv2F8dHxCMts00YLCNzQNAJd75fck4F7jwA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr/QnlWBe0evtU8aCYH3beBHyJvEPweOE9tYl7ZMy69KCrOzq7
	OFe4P1LICGQ5KMmp20WH3z618YmNuwOmUduZJWssjT7lnlcZLTIEkS+JiA==
X-Gm-Gg: ASbGncs0HYg1oTBekphA6dzJmrMWPQe7xEJ315OdWveThNN4SHdBEligGNrtlUd29s9
	lAhrX7/E9o/DJ5FDObTPfrG1agfH9K39dCORgMPlVgpH7pp3mZb8UsHBbYLF3jcqodDsjFUpbg9
	jdeU7McWPN/WjiQA8epiUMPUc+eLwKnsV/+PkTdWuOmqsyYGN1Ec4IQJkRI+DvWWWSbkrQHjJzr
	N5/2suIf8S4Gymc+47wafX6MfvMHr3ipRpyqj+TCKjzFWJwL0zq1HsrM3P124uMI6vS2t2shVod
	tBbB9eXA3ekoPgUNDFMRegrN5WIDIlvIYbHBLsMJMv4XVItILbfc7ik=
X-Google-Smtp-Source: AGHT+IFlRA1ASdPJHVciwnsTAixFnm9+f7L02Rxbp3y0Ul030LzW40hSSZUseZYzvsv3j9+MbuLuQA==
X-Received: by 2002:a17:903:230a:b0:220:ca39:d453 with SMTP id d9443c01a7336-223f1c81e80mr96320715ad.17.1741247679382;
        Wed, 05 Mar 2025 23:54:39 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:38 -0800 (PST)
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
Subject: [PATCH v7 1/5] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Thu,  6 Mar 2025 15:54:25 +0800
Message-Id: <20250306075429.2265183-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235440_368987_F4963FDD 
X-CRM114-Status: UNSURE (   8.96  )
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
