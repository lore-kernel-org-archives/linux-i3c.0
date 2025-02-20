Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7CC021B1
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGbKAsuKtU6/RlsUJ/XmK0g+I5TPz/glE8Ta/86QsFI=; b=bl0dgCfPyKdXKj
	zv4Qq3RzsVroFoMNllEbJnO3JOEOtDKpcETBkeQg3AKbtNFDT37JSS+pJZ9t4cPQYpMbGR4Mj2MwH
	xTmQHRiDVxVMAx5V8++T90+clxa1y2r2fF1kkxSbJyk0xXfIs/CbZGyNccXAlWszkIG9gvwlLnwUJ
	XEZwGb2utVwPXM7Q+s0S/b/3nESr88dYC3FL8YDNLwGoONn8wsBaNk17d8pyJaxRAew13O0uJAwpV
	8Ak3UWm3ADEqTKVU10lhB6zAB1A8lH9kqvdUf2dx1xd0089dccHyGqJGwry0Ga45eAE3Faz5FuakK
	QReeyYcnVCCdoNzEDR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLg-0000000GptL-3Wm0;
	Thu, 20 Feb 2025 05:43:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLd-0000000GpsF-3A2G
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 05:43:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-221057b6ac4so8252365ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 21:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740030225; x=1740635025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IMohSeK8gkqwGyZxC38NO7B7vZzY5EIwZHxDi6wbmo=;
        b=hYXoiB2HEtbYNE8CkgPzX1syWT4Z8XaYJ7k+cWzxkFoz7w0HfbCO3UxJvoO9nAy2nH
         vECtZffbXCYSsLPoIftJX6/mQV3s5CJGgggTe1kiWwYblvzZdxckX05Ddd1HrGKyzzD5
         +jRAUf2dnmxtNs8T34YaBHTCn9m5QC+24poZZX1WVw/hRsRSZhcyB9b5JhjeqjDuZext
         yIhCMWV8Bk9yEzARKN6ueyVxpI3iFGw1WgsRGuoQnt1devxa87DyzOO6NfemcB4EZkdH
         5xqjzhRLREFRIxch345x4m0doFKuxIuoKw1ZR08a30zhUi3l01p3wAfebVZzVMd6UrpM
         5+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030225; x=1740635025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IMohSeK8gkqwGyZxC38NO7B7vZzY5EIwZHxDi6wbmo=;
        b=HQLvULWHPqdDuupqKYDqcv1kC6D7c2efi9lcuMHM4RGkJUTTC6DsjHEmH/zNW9Fr2H
         lO9U2fKkPfOoIKNt66vHVOoDiFSA3RlfFqf60apJRogVvB+2XprzzZrqZMgeO1Kg7IyF
         T5jwwIFxOjn2AEoul5XpGqU3SsfmuDFhi5ee6O0fjqGdtxgel+Mh15rEOt28f69C+/Ih
         YHojw9DVJ1UrCV1xbheih6Z/50jhHiTLAlHJEdTAk31A6nfgiog9de2dShdiIvb7d4QJ
         AH/y38X6i8eaQWiesCktvI9r0lgHY0TCR8Q2UqJGgkfkjRr++05+OUz3SjjrBiyTgzeJ
         5qxw==
X-Forwarded-Encrypted: i=1; AJvYcCUCiBcP+0ev7oC0IqcABikr/v1dwwGe11aKVyo4NqRXCmW5Vg2oPrnBMsDZqnpUWNTayUi4ughvh40=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVZUFjO78dMhIQ2SBIn1P81bCSiQlme7ID6txi7bl3F9SZRVL5
	0N589ZP8/8ezefQGRMQyFs1IMPDxTYWJcrc/0n+1XqjfkhFnlL18
X-Gm-Gg: ASbGncv3FnMp1uk6PFuTJDmW+bI35HzLTNQigvATREClf7rt0/mhFlDKKaP8eDB1FVO
	mg00Vboohcqn+etsDdIWCMEaeSk19gb+lS3rv1fQjHOQ4dx/G6RBMyuMLcdfscahkgbr5Y42BMy
	dkFpjMbb5C0hZ82nVF5l1/P+EfQ8C1A96jJQEVtUXkv/msvo9fDzLumXXlvK2Kc1y/AtrYuJl0r
	283tuJ6GYPYSG1jv0mHJUHgotwpe6HSa52RmwpU9YyPUiOhO+ERxyVR/mnDAl1696uKlSvyWfvm
	2kJ1ANd4gECVSw5TGHpj7PtywQ==
X-Google-Smtp-Source: AGHT+IGBXepTc9P17+2mR0kT1gPNO4iTdvt0WTXULVcNdkEoHownFPvxNPEmpScIh0GvM1j1L9uplg==
X-Received: by 2002:a17:902:e88d:b0:215:bb50:6a05 with SMTP id d9443c01a7336-22103efc0c7mr317994265ad.9.1740030224974;
        Wed, 19 Feb 2025 21:43:44 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534951fsm114415335ad.25.2025.02.19.21.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:43:44 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Thu, 20 Feb 2025 13:43:27 +0800
Message-Id: <20250220054330.1711979-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220054330.1711979-1-yschu@nuvoton.com>
References: <20250220054330.1711979-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_214345_802420_3A7CA09B 
X-CRM114-Status: UNSURE (   8.70  )
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
