Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDEFC021B1
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVgXP2bZ2W7nUhFqDoLCgBV+5hZvAhwZFjmlYy+hiLw=; b=1thZWrCzdNrIrV
	Uddx7SdsDut3U/fwksrmuRT2kER7U+aYvHlHLei0T2zA9aDp0BovxbcxOEBU81LcIBksY3Y33abTK
	T6AlxxobY//ePgVbCVww9tCEyJItfHG+EBRGyKRjLh6B0k/Z92zfXGwXC7MMmmZqgTmNAR05IcwsA
	1Oe3abRF5Pc6FaYg2phkKFOR/Fsmr/cwFfx7uONy6uBzqdzKkNtkAHFx6uAPVWdvkh2hldmGMhR+D
	LiU0266mTRHm0hgWVJpBMD8nD09yP+1yP1s35T0f13jy0ZiFMVc/oeRRfLSAjr0vbsrvj+uHNJ/gu
	Fe/mmj6yL5kQLqWo+Syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkznd-0000000Gtjv-1fCB;
	Thu, 20 Feb 2025 06:12:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzmG-0000000GtMs-0cEG
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 06:11:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22104c4de96so7610925ad.3
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 22:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031875; x=1740636675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NhZRYUnG3q+UctqXkfGAttcdIouM3jfXXmawCdJWIU=;
        b=JwaTKQP+FIXY2jhV7JuFaV0hK0fcs9pI5bH+f0Wnnjf0OGo7IxY/x5PqKmEphK8Vgt
         nyl3C0UQet3vmZkv2FBMJPMMvjA3iazw9Dd0HjedmUaww+sBH+ofr2OXJ6dm+QvDtdG3
         DYLDBSosqEycaXHhFFF0kc9xic/+xtOPaTBTwkSRIDPa8oUcd2NMsjZmp6VURXokEOsQ
         fL2BJ788vXMne2oT1izVJ9sjYvkGILISF6XMxpodZ2h4a6jQTICvBZQ4t34LfGSZfabV
         qDvxkvwR1ciazJ2fQxUAlA0rH1M+foBlKKSa9iJ7cIgt1JEGTTZj/Zao0agfpPP931zM
         CYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031875; x=1740636675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NhZRYUnG3q+UctqXkfGAttcdIouM3jfXXmawCdJWIU=;
        b=V81QufewDCQ2oXdAIbknLbmBpqQU+fP608Jn1SoMZD08JoqRvyry0/U+qITA907X3f
         eUspuOWuyQMyfNYgLl1HpPoJ1cu/EmM488jJJdFQUqolWQPHrgtgrWzd55XksQDwo65G
         mC3dKE0jLPqS0i1CW7egRGwJlGrFcWMmRkktW4Or5PfX1Trzs+awxsF6DjzV8G8XJOqC
         MCQYK/QxvTeA1RWGsdsJX6vXH6s0NXFyCjUEK038Q3eCQ2lhhmqOE585seeRvXNWzvqs
         9Vdi01GttvrA7QZgoDYhutlR+Jb1srJLpNBvsO6WxfKQgGQxWShoXlAm1yGAczjK9yFk
         uN0w==
X-Forwarded-Encrypted: i=1; AJvYcCUituhMPZ2pQIADzsQ97YthruBx7dQ9XGTJRFi3neem9MxZrs28J5UbVVoC0jeRJeLGhPK95+CqwQg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7iMVL4XqftrurUqliKatk3+a0vfvQW92ZM9/QCwfbLvUfaw7U
	fsmqbM+U6Mu11xHlFQ4HIrGLhePLwbyUW+FZ4fx2bjMxJLPAXW0K
X-Gm-Gg: ASbGncu6YQVWedHEBPkvc7UhJZT93ohpPFbzQbC2OqSnwc9bZUOPOBhE92pLDOkmZdA
	rdI1/0jXnJYVeHSKaF8812Noj9f3gnOceghGp57Kc+4flwYWkO1GIKhzprj3mquJf+ONZvMMwUt
	vTN9Idx32A5F4T4lddIktQUSSGpLHXdmxrg7tB8GA5YtC9VzAdUFAFfvzVTEmceh7S4JsGoxEDZ
	vPGX/3FbL998QZJCFB53jZjt1HPy8RaZpstSS3eIL2QlN/tRXv8qogKCbkNbP0SSUkIYExPLVvQ
	7VRnlRyV2Ng1Q43EepDPR/aHvA==
X-Google-Smtp-Source: AGHT+IErgDPvFbaPdYnyJfTUCqNxawOLeaE4X04U0/a/Og9Fxydety9DBz1/dgpY50LkVuvvq0M0oQ==
X-Received: by 2002:a05:6a21:32a3:b0:1ee:c75c:beda with SMTP id adf61e73a8af0-1eec75cc2c3mr18787100637.35.1740031875401;
        Wed, 19 Feb 2025 22:11:15 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271a02648sm8226823b3a.107.2025.02.19.22.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:11:15 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH RESEND v2 1/4] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Thu, 20 Feb 2025 14:11:04 +0800
Message-Id: <20250220061107.1718239-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220061107.1718239-1-yschu@nuvoton.com>
References: <20250220061107.1718239-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_221116_215324_CFDC4589 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a compatible string for Nuvoton BMC NPCM845 i3c controller.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index c56ff77677f1..9be4bc4cc482 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: silvaco,i3c-master-v1
+    enum:
+      - silvaco,i3c-master-v1
+      - nuvoton,npcm845-i3c
 
   reg:
     maxItems: 1
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
