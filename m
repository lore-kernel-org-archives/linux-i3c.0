Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFD5C021B3
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1aRRSlsUHYkXjWAAut0Hu4oev/mHrleIZyMcBnJjTEA=; b=FdjXXScAj6IQ3l
	g8yrhFkgsJnI6mz932Q3eUq/AHoog5RdVD97ogi3kelkoi1n+NBibvC0x6AchT6nnxQE8Z0rlyDq/
	WrEjT/pv41LWRm8NvCF8eqd7mV3slvQY5TOHvxY9bz5+YyRRiSwzQn56oh5ZUyQTUHcsWF2HtXk4d
	s+SoNdJ+U/5KMRBiElSQBdlVnh/UXwKegpSckM+r237CZ5UJrG8u3StZDTQfvn3zXp7YE222Y7TZs
	lqugKKtMAvE7HR2U7QDUFBWX7eZF1n+0cxBpYYbL9TflUB/LeLo3GJbrJWMbpB9kHRVAlHwPa14vu
	Nq6Rj/8+Tuzg7o7l1bIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdN-00000004OKt-3r6a;
	Fri, 21 Feb 2025 06:35:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdM-00000004OKF-0MJO
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220e989edb6so48362595ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 20 Feb 2025 22:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119735; x=1740724535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaAwgWYN6mC8bbarqgL9b/ntEOrc+hTOljfxQkKCFDg=;
        b=Wj6jkC7+whwsT8Pb+z8FFj1uVTphOh7Dn2aHCXQqWFtITSOW2QAmKlcgMx8iPt2XoC
         c6Fxbf8Ez+yQdCxe5lipxYjVQuKBH2gY3hxMPVTVSI8vBN4gBCQTfsD5d7DPtL49nqlB
         zpOX9NHTGo8ZG1xviKyFhguRtFadGtfCau1mc31hNTUk5m8FUxJUEQ3ExT+1W/TLmVNa
         Z+ZU2VXtNibtKMIMQXTHhEs2iz79YaKTQkkzHSKqW0QCfRfileNuQ25fd7pcbGXT2dN7
         Z85kRP1eJY0N9Mh4uDU7Dnf0D/3x3Xo++UN3uPeBwkzVyMp48Eb5r6oc7ambYmVOSTV9
         wiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119735; x=1740724535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaAwgWYN6mC8bbarqgL9b/ntEOrc+hTOljfxQkKCFDg=;
        b=pnjkK1SU5x7Kx0dE3Cj+XTJ5q/Ncb0xX9IFj22yi8rrgCnbVMyTJ8bIhip6EhZbcif
         QhNix3kV2VCZhU1clO8wF10uAUIssriGzR5a+KMkM5GGD9ixmfTEs3EmjPcPLSrCUUyL
         JMu32obOL3lSxryPBu042oysUKokmB2iCifllw5mG51DErh9sODfVg0HsNwqhzGsZejH
         brvJusYcCdd+45cC5qZypF64JiF0hZEHjT4+8CY7NQzWJETes92vIh+sQNrpgPV4iG9g
         QnQo3z6y2EYZHyTy543jzQpqD1ijQlFxszeKjC7PIpInatwhlQQWd3BtsUOVC8aN3eKR
         +9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVbXiYijcJ7277flt51bPnX1qjF67vB5BpNuoXRaWiI3u3CWwdyGwbxJZ24GnabaPDHzUHQPz2Z+g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz++GePZpSfFRALJV21z01oKFa/BI2Czb5ILQDC/x1nPH2BdlGd
	hVwfXKtPsDCw8VICpgtX3xW23xaUQdoh3vbU2y6WsPACtNh+R9eQ
X-Gm-Gg: ASbGnct4giCC1v3vo35Y51NrAIdZ5R9A23yxQXXw8/JK7tFHEBF+ym7r7WFOr5+MBnK
	x1zvMFvubuYlxI2gV2xCTZB6ylkyYy1ZKWeiGmvlG0MkMF4o7ojhpkH+HB8aQuNhDqRTuIdzMHa
	Ix8n3CtsT9BfvjxCp92DbJ/CliqpjJ6QgK8ojWwiJ0zuQUfbIgrVMuIXb9YG9hcpkUujUqz8XlO
	JyxeNmAneKn3A5KFrYdYmhSgrq1WGhbOfCqcd1WSvl53aP0wiFCJY/xsgIlEV6j7HPk+Wo9EBFO
	2a3mtI4/vgiCQD2O2Ke8I92lPXbi8wTp8JSq
X-Google-Smtp-Source: AGHT+IH9IEr9JoMJYSAg85kbfpXIEgYLzM3yHCu2Pv76Pa87pXjWae8C0Nh0Xn4+HTysrZd6HUuoIg==
X-Received: by 2002:a05:6a21:9988:b0:1ee:bd99:9c71 with SMTP id adf61e73a8af0-1eef3cdcb2fmr4082990637.24.1740119734846;
        Thu, 20 Feb 2025 22:35:34 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dc68sm13777275a12.9.2025.02.20.22.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:34 -0800 (PST)
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
Subject: [PATCH RESEND v2 0/4] Add support for Nuvoton npcm845 i3c controller
Date: Fri, 21 Feb 2025 14:35:24 +0800
Message-Id: <20250221063528.1810007-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223536_165264_FB8D8AE5 
X-CRM114-Status: GOOD (  10.80  )
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

Stanley Chu (4):
  dt-bindings: i3c: silvaco: Add npcm845 compatible string
  i3c: master: svc: Add support for Nuvoton npcm845 i3c
  i3c: master: svc: Fix npcm845 FIFO empty issue
  i3c: master: svc: Fix npcm845 invalid slvstart event

 .../bindings/i3c/silvaco,i3c-master.yaml      |  4 +-
 drivers/i3c/master/svc-i3c-master.c           | 57 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
