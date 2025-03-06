Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C7C282D1
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=avktrMADwLB5iiDtbEpyuewzH49niGGGpywbbaIy9SA=; b=BTDGvq2gMDtXEs
	iBd+zIFM73gYpThURWv0RjkLRMwc5V2W/nODhgNdVDvtkpvHRbr3o6SX9GUBV9fA6YaJraD0Akgmr
	FoU3TWj+F52nI0yngozYR4AElCTjpMN4dfay44I45mlDdEIE7rr6oPgLD/m2y6TEahCsbVo2t8/Nr
	i2xhx60MpB4ejtqAvu4FqRScPd6Pi2OcZVfNWnjwMmYtEhxf8f+xIdfw3Hm/LFlShN5J10tJ9UE9q
	A6ruF/rhsph3wW4aq+3e5FYsWRslVMylMYgNfxC2K4090cm1cI2dh80atsGTIj7FFEU7O375wVcfp
	pvBchPLefB7PvKXdtYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq64w-0000000AGN4-3KNp;
	Thu, 06 Mar 2025 07:55:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq63x-0000000AG9W-25Zx
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 07:54:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2240b4de12bso7210205ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 05 Mar 2025 23:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741247676; x=1741852476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EoWjrryM3cnb80aR51wUjGslugRyRcpKgUlsMR7wQo=;
        b=mAmHDWdyDk2AQz8bTdmAQzh8KMdwNkyvARXhGGPEVeIQDH6MRFNqlyDuKqmj0H8xbW
         9K2amL/Rj4pCN5xLkGSq9Pp0kYlhm9mybCW6EV+nILzI6Kpv+YHV3xzIp9B9WF+wOvKP
         GU5AIEHWV4W8zFHgWmaaaUMjtuhdAu2qFfhamB7cbFlfi9BK1CXg6v3r0FlIjJzFbHIT
         LmeSSh93XJtrTWmM2DVbFAwtJuE3VzvYYViqza4PFWd4JjZmjQDJIdIqGcKcnprtTC06
         pFXy6Om6rDv4YnPDxuUV0OJQH9fX4B+yoBP2fpSQhBUklRNWATVaKbMo+fAkNXOPctuK
         g+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741247676; x=1741852476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EoWjrryM3cnb80aR51wUjGslugRyRcpKgUlsMR7wQo=;
        b=rvfYMTuJMUf8I5nEKThRhD+NcwCt/L+GJfJNqOpKTp8xpwsLZSRVZYwq5IG3/IWdFi
         GysVH02gOV7eKtPiJGQmODBYgaczRoZA98YrNJ5kZ33OjTSgt7Ph+tX++v/nLP6mNkq4
         8pqp34l8zFKuDYW4KL5JokDz5pdvurZ3GQCQqsX5lKtQfWJK4+eppVRq648alUx8Gf7S
         uds4XvlETAbWXYgDipcIIadUNWPgQjsl9YBrjMcwN32074bNgbMzsw4o0YmNI35FNdbx
         YnVQ3i6IzapokXKVJmn9FmLZB30A049SoTiEP2Z6fSWdoupq2TabnhGiR3dHgMx7/dvb
         ynGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVShY4QBk35haOB5+gfbq8TFD+TCAPqzzJrjO+FgvcbK4jxZmEF6gXr8umj5NZKIhFIvWit8cZBqfI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQ+pjEuv71MSPl/c5rdWOpMBSbBchedJ/KflS8r6krJ/4Q7/I
	GjFg2YIJfQndoEhjKfB6+iguFhBv1O/C6UFXHn30Hn7PSnT4iSSO
X-Gm-Gg: ASbGncvKVEKyKhHWUXV4iol/EtJN4dFtIRAkqxnsCoLq65Cc6+tP5m1yGB77Z4lI2GT
	ybxzJLO0A9iowxKn4nj/e+8iegZI/cdzjkhD/TQNbvIjyIz0oP01OaBEnIInEitVMsd1hDG+3o0
	Ey5dk/7XMWDDQmArW4W+ZpkuxSrVmVs4U/Tbkg7d2GLZHvWitGWkcQ5boSL1sU7E9n2Za5ui6c0
	ZcGXnuZAHD1pVsSHHJ/nu//TNRdP+YwAHSzhpxYyQDmGMPrwLgCz3KrXO2kDj87iXHdFnPuZ2fb
	GnQM9wmMbKbDxY8wZTPHpE1FU8UACVLR2zG85Z6O+S8uybrYB7XGZUs=
X-Google-Smtp-Source: AGHT+IFkTNb1TU8QOGhJBLtwLetrv/CPBoiu/a8Jxcw799EbGPWM9Mv0kQTZHRXkBK37PQl1oBhQbQ==
X-Received: by 2002:a17:902:ec82:b0:223:5c33:56a8 with SMTP id d9443c01a7336-223f1d26109mr108359395ad.35.1741247676124;
        Wed, 05 Mar 2025 23:54:36 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm6085485ad.210.2025.03.05.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:54:35 -0800 (PST)
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
Subject: [PATCH v7 0/5] Add support for Nuvoton npcm845 i3c controller
Date: Thu,  6 Mar 2025 15:54:24 +0800
Message-Id: <20250306075429.2265183-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235437_533279_1112FA9E 
X-CRM114-Status: GOOD (  10.89  )
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
v7:
 - Fix kernel test robot build warning.

v6:
 - Define QUIRK when it is really used in the separate patches.

v5:
 - Add default driver data
 - Add helper function svc_has_daa_corrupt()
 - Revise SVC_I3C_QUIRK_FIFO_EMPTY fix and add comments

v4:
 - Fix kernel test robot build warning.
 - Add SVC_I3C_QUIRK_DAA_CORRUPT fix

v3:
 - Add more description in dt-binging commit message
 - Add the svc_i3c_drvdata structure in struct svc_i3c_master
 - Improve the do_daa

v2:
 - Add a new compatible string in dt-binding doc.
 - Add driver data for npcm845 to address the quirks.
 - Modify svc_i3c_master_write to be reused by SVC_I3C_QUIRK_FIFO_EMPTY fix
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
 drivers/i3c/master/svc-i3c-master.c           | 127 ++++++++++++++++--
 2 files changed, 120 insertions(+), 11 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
