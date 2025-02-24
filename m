Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B24EC021B3
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=piT/wFry+vsvfTq0zvTyqxiRiNUCkGsQNcuGp0qTEyo=; b=xboYAF0yenaoEO
	r+HggKG/qbzrqK49PLD7ZCZT6DLnWKP1P+EHWE5svIBMzFWYU2VvfzpIbT/Ty+JeZNph97WJcKMd7
	JHssdOTDFX9EzervxnFR5ra0Ih9ctXrCLN98NjTUgaZfMNWtdNWDt2N6uTkyPfAW/WSFWJT/VGf0X
	jKMzKY/HK30JfPpONLTtpyQLNurW2SKKC7b5/VKNdxk6seUqJSgKX5TELZrIagqENDdxS6otIJKBu
	V9G8xoQq5dkADmnx8UXy5maB3VNbfLp70B6rc2tdjffrZd2GBaD/ragE2vJdYaHU6TlAuw5LSA40M
	ZoSkcFAvAsggSFTFwFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJN-0000000CnL1-43sx;
	Mon, 24 Feb 2025 08:59:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU08-0000000CjN0-2X16
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22185cddbffso82806615ad.1
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386383; x=1740991183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgImrHd0RRBAL4u0fyRPwzKU4+tbk6UR0vRrSIGp7oo=;
        b=M9uSvPws0+DN9C3JFaJZPKGjeTz2xWiujPj6KndB22YKHssrLlMVKI4dFEdgsqRIOF
         WfeaovzsYRtNzMBW8kxTCEnJ1ECNSqazl//Z/uXFJbMBP0aWm/fLGTNTWdEyWQ1YG0RK
         +9yM6BIzihYPCwMjs35SfXEhPGYqDXH2BItIW0D6X2oIHMnwTbw0ATNY+NO8b/foJ036
         fIlBdFifxqwgpzDICyb51omW1SxxI7b91ENx2mDcZ3Ep6yxJfWNbcLJ4zRHbcsqCBz5s
         SLVHNhSBKGWXbsJ2z/ikhlSRxt3TPxG+ePgY9p+6qTgqiBTW60DxrsHLMvxdK7wks826
         ZLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386383; x=1740991183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgImrHd0RRBAL4u0fyRPwzKU4+tbk6UR0vRrSIGp7oo=;
        b=eUDHktiqMr0isSBS4JiIrHDa0W8lFITbA1qi1PIGdbdJGee5dXLQbsw6FiMFGpQJvN
         vm78/hhsfX5stU6erpSADZxXlKI4SNNt+qGPcJg6CbPJYBQAKHI6l3y4VbiSXTbxJn+J
         NwCALrM68ClBP/qUCCtkkiHUzUkFCCJyq6zPswuPINYI06YEjF97e9D0PlHQZrDPdoqK
         DHxOuIinY0w9fxouIbv0fUtdi+5hwe79ROrD/7kgT9/lamIoCggzrWPjXVL2HwOFCHo+
         hwM9IjHRMtYUrf+DJKTkpT0tpkvNvKj2rV7leQ8r5bvEwP9hJnqwQ0C4v0J0VdUZJ0s/
         nm0g==
X-Forwarded-Encrypted: i=1; AJvYcCVJskRD91kgWp61yo2wov+0juAFWEY3oRyGFhSb3ZQWXNIb+0llxFFX3n9sMPyz3yvUmA9E1NrrsPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPSN98HJNXhzMcSSKyx7R5u+flWSMl2QrpIgqM+lkMPBcznHRN
	ORPBsyptJZPvpH7IxytDmdqhmtAxFSxvVwcEN/jTqUHfRTk9rUd4
X-Gm-Gg: ASbGncu8NfQtvnu4jPjxmQUfjBAhAJzmCnN4Py3cU8mwmfDRuSb9RV6r5IN+rdmsX25
	W0xY5IWgoKd8t/T1bK4kDTKuvkp4riGWzPTrvdwqacaq2xV3Zs29l/iPm5ydNHYx+w2+jT/NJIc
	p8UPG6i79cKWMyB+wNXF/rsSxlbeXQH0ZXLL6w1j7cr3gzByQ/TAn7sTnc6nW5WfFsuFUK4RmsQ
	6FYqo7Ff5z4nTqLFkaqpWWPZj1qQzPQh/Iaj59BUNgVXiF/lSWyhtsbpv4qMleiJBrwsMwKWBuX
	xglib1+a/r/aos5wtaqMCU8NKk5Xs15p+8qh
X-Google-Smtp-Source: AGHT+IEcb6Vmiu6r39Ib6PZeI+7bMy0EHmy7fhM6DiJP4D28MgnS5rIX2n3fCefV4ha1sPe28cT4dQ==
X-Received: by 2002:a05:6a21:6e47:b0:1ee:76fb:8eb7 with SMTP id adf61e73a8af0-1eef3cbe982mr20076936637.10.1740386383559;
        Mon, 24 Feb 2025 00:39:43 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:43 -0800 (PST)
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
Subject: [PATCH v4 0/5] Add support for Nuvoton npcm845 i3c controller
Date: Mon, 24 Feb 2025 16:39:03 +0800
Message-Id: <20250224083908.1880383-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003944_649973_1A637D2E 
X-CRM114-Status: GOOD (  10.29  )
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

This patchset adds support for the Nuvoton npcm845
Board Management controller (BMC) SoC family.

The Nuvoton npcm845 uses the same Silvico IP but an older version.
This patchset adds fixes for the npcm845 specific hardware issues.

--
v4:
 - Fix kernel test robot build warning.
 - Add SVC_I3C_QUIRK_DAA_CORRUPT fix
--
v3:
 - Add more description in dt-binging commit message
 - Add the svc_i3c_drvdata structure in struct svc_i3c_master
 - Improve the do_daa
---
v2:
 - Add a new compatible string in dt-binding doc.
 - Add driver data for npcm845 to address the quirks.
 - Modify svc_i3c_master_write to be reused by SVC_I3C_QUIRK_FIFO_EMPTY fix.
 - Fix typo of SVC_I3C_QUIRK_FALSE_SLVSTART fix.
 - Remove the code changes in svc_i3c_master_do_daa_locked, will add it in
   another patch series for common improvement.
---

Stanley Chu (5):
  dt-bindings: i3c: silvaco: Add npcm845 compatible string
  i3c: master: svc: Add support for Nuvoton npcm845 i3c
  i3c: master: svc: Fix npcm845 FIFO empty issue
  i3c: master: svc: Fix npcm845 invalid slvstart event
  i3c: master: svc: Fix npcm845 DAA process corruption

 .../bindings/i3c/silvaco,i3c-master.yaml      |   4 +-
 drivers/i3c/master/svc-i3c-master.c           | 115 ++++++++++++++++--
 2 files changed, 105 insertions(+), 14 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
