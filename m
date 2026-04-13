Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D87BE9380A
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 00:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MaEukdib1Qb8Ort/tCU+J1xm97a0REVifjooXwvibEk=; b=w0zA3HafA+AXDa
	XPdqUz6VToci+cEdxQgCync2XVSLyJIYZ80GcWh/s6RV16PxI8u1my+e9C8hdEPPS4LZOotx6/r97
	Do5dReSzq4VujNBuwgCJ4jaSxkmJy1HsUfLoHGXW8lRxjQypymyfBN+blkWnbbEkQrzdCY2i42mA3
	TPqdlf8bXIVMXqzNL3qD37eV7L/tKC4AhLwR0Pzftrxs+nZx01/iK2Isv5Ynmy7nHVQSc14AMLAte
	byz2pZUuk2Qm5w1v8eaQ60sQm3huxGO8Z/J6bgndpJhvb4NvUY/Kt763I3S9PoFk8nPdArM6BhC66
	hDRiJSqc7tW1WTWXTOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5Vz-0000000Eosv-2ozV;
	Mon, 13 Apr 2026 00:50:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5Vx-0000000Eosc-3w9B
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 00:50:59 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aaed195901so17142165ad.0
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776041457; x=1776646257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=No22FiMdOj9ydCPrxRJ81A3q//jiid+ZepTRfEn7kyg=;
        b=YLDBAB5CTjqZDA7rClSlu4mAfHMoxhP801900k32bcrieDZFQW4SxmXAElyRjiqKS2
         7LqVd338PaiakUlf7mhzfvU4nK6GUWNHukRpXZSWat/z/cAFHl4VMAlOr4oQIKIMb+S0
         9VCldr9D09ObgpYcePZLkvmOUe9Ilp65vSJQlgoKCntRZE42cb3TeW7jSmOwTRJlp30O
         mmc9a6iXKAMF5nuOh4rAX7eRbehxdigkRBs9Tkf1X3UotJ/PHrb52UKYOHQzDFDYapHi
         Iqhjhi7i4WMbEVEjttItIgIRiBNtalrpWquFsKpGL9IMyPqsvqV2ijirl675wAH9b1vQ
         aY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041457; x=1776646257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No22FiMdOj9ydCPrxRJ81A3q//jiid+ZepTRfEn7kyg=;
        b=Og+uN/uDHqo3nPM4EBdALYHWxwJARCz8/sQLBCbS1Q5dvGdx2qWb+MH7AAwjj6ICzw
         Kw661alrmXIkCdPmuU9Gzpq3Z+b8St/45GSBiS/VJqgrssl067KBBlfh0kIgScuLK29c
         mbp7pTCjFOGlsiMCDzuCfxD6qcwbBL8J0ASENu50v8GBGV95XxwALSeLIuJTrH7BDRzI
         OpiQKsd0Uwl27pT7Fl4yqgaKjpyaN/x2SNja+uDS4qYguBTjKk5cYosHx9WlyaWdsyQI
         2PK8zAcZ5fSjB66zmrmeb+AqR6CgkWV0XVetwN8uQqF+WsyjNSB37umxV3MdSzgTxBL/
         jQSw==
X-Forwarded-Encrypted: i=1; AFNElJ/Gad8Oi83wfU3h/32HOWz4fnAKFOja9wak9bw7lRbQZXgrcCI7ReJnHdcRmL54HBfpSnGcv2EA56Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCetdSM3nQLGB0O1Cy05iomwwufW+YeV6I1qGqwSzJtK4+TtBq
	JKB0Z0/Vt8jS6KOmAHNKf7QG/76Be3OsvSEH6yMCVGjZPGB6i3pmfgN9
X-Gm-Gg: AeBDiesMKqeI/7NQDXe4E3sW4sP5LA1BFsquqLG9+Jdy+BO6yjGA6aV42whSNmK4XuR
	we4rHqW8qVrA5TvROpNAIO2vZxjdDyz/ysPaM95nla4ZUDI7WN7seS1XVGMC2r5E2BC/Br6Cxlp
	QlzOvWhPy1uS04mH8jr4CJMmH4TnMtNAfWkn3zcWrVkf0PkePdZcZPlK2jeROCkc76bVffdiqD2
	PRv+2bEpx1oBfaunxawlvlyM27RJWdQ266FZmYtI5jqr3GIZJgKaThmT+b0N9qwXYSwO4dLfvU8
	/SixS3WAjFQl4JUY5EIrUHvXTf8uvA8hs989sQkqEOSbgapdStvEnukoVxpzvQfnqUjW9413Yro
	DDWLmysmgBxKFWWSnBgMY1DTU54pBagXWDpJBG55gF5SmOrXWPV361FSXhb51Mr7W7y7vhlOhPJ
	KDUE9F2ktcaMeVV0I911ykauHMlFRiw0Z/
X-Received: by 2002:a17:902:8b82:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2b2d5a65539mr77979395ad.35.1776041456593;
        Sun, 12 Apr 2026 17:50:56 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:8d94:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45f6c0219sm10828465ad.10.2026.04.12.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 17:50:56 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 0/2] i3c: master: svc: Fix false SLVSTART issues on NPCM845
Date: Mon, 13 Apr 2026 08:50:38 +0800
Message-Id: <20260413005040.1211107-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_175058_003216_761244D0 
X-CRM114-Status: UNSURE (   6.98  )
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

The Nuvoton NPCM845 I3C controller has a hardware quirk
(SVC_I3C_QUIRK_FALSE_SLVSTART) where a spurious SLVSTART interrupt
may be generated. This series addresses two separate issues related to
this quirk:

1. A race condition where a real IBI arrives after MSTATUS is latched
   but before the SLVSTART status is cleared, causing the IRQ handler
   to return early on a stale snapshot and miss the pending IBI. Fixed
   by re-reading MSTATUS after clearing the interrupt status.

2. When a target holds SDA low, the controller reports a Master Request
   (MR). Emitting the required STOP condition in response spuriously
   sets SLVSTART again, re-entering the MR handler in a loop and causing
   an IRQ storm. Fixed by explicitly clearing SLVSTART after the STOP
   in the MR handler.

Stanley Chu (2):
  i3c: master: svc: Fix missed IBI after false SLVSTART on NPCM845
  i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845

 drivers/i3c/master/svc-i3c-master.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
