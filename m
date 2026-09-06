Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83548C79F99
	for <linux-i3c@archiver.kernel.org>; Sun,  6 Sep 2026 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NmOt+LMXEh4TOmyduL5koSyisoDolt//kGwamjLXZMc=; b=OB1
	xp7DBMJVdOHksrAIpY4nCbCyNoXe9luvS0IWTtqX8z4h1nzocQ0QRTWdL1u9y4v3GFtzydAd8ZvCh
	jEGN467KYJ8n4NVLrgdhAnoyUVwd/01vnutN0kOsGtDTxgam4qfGV2Rmcf3IPGeTcCHZtRjXabVjc
	ozPdF/cR705/UUliuTumqtBKxX22cUCSbfkBJNaHBDgExRAPkCCb9zm8aiV/V5wTUKF4BD+JgyXlW
	wPZq0gYb0S7TyN5KjZF+JXzs8TDutoHU9KO4Ch1yZK1RCkvcuEhG3dmpbHyx5l0Eq141spjbi6Dl1
	mVQ6zTNvwmGF2VYwRrbt/SuMHMYkr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUH-00000005YMn-0HL4;
	Sun, 06 Sep 2026 20:29:14 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUF-00000005YMA-0VC4
	for linux-i3c@lists.infradead.org;
	Sun, 06 Sep 2026 20:29:12 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso5116114a12.1
        for <linux-i3c@lists.infradead.org>; Sun, 06 Sep 2026 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726549; x=1789331349; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdOF/psNk7u0j9Lh9H2kzgy+dViSQ0MMlbl/hGjVxJM=;
        b=KZgzUutzoEoLUCdklGpFwKfb3RpyrBEq+dYDaxlwD4eIfPxweJhSUBdG7WJoMli7Ok
         En9w0vH/fb6JPsaXsW/0poqoF3Q8CfbdU4XE5/lpQPHQnB2THbq69m7WFOepM0PTFyWE
         UmlxH4o6aLOof8L1hnzKoYPxjnG04CkDzKFoxtmH/tbw9Ou9Hmk+oudNQzZjIz6a6AZA
         LRZxl5e0lF857S4rUDNASsMYbWGQPp47moowaB5whqAKPcZX6mqC4M3B5yG5ud2IeLn7
         xjDI/BhQGQVV0Q78kcsWvFONBsNWo0TSUOfs7orL41PBbqE3w/8zSSMclmnVJC40yclB
         YifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726549; x=1789331349;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdOF/psNk7u0j9Lh9H2kzgy+dViSQ0MMlbl/hGjVxJM=;
        b=LUuWiTtInS+DuBj0Gq/UeRtUf6oN1PwhL3oO5Jf62gqGdKzKuvtTaDQcIVxSoqcG+p
         YDfLPx746rJKG/Mpn0RKKaK+3WfmZiHvnqNZG1ez/G4e50PUtOwt7SivhRRsaBxDbyDf
         HVVR5NhyjQZGFPhiOTMCNhPb6AObg6ntRijBSxOlBtW0tDPTNYGMxOMBW39EUDHo0Asl
         ohkOWBKnXEfvmlK3YmlZRprqgzkh7xjWzFWRTRVqz7Wa9KD6AhdwObYgppV2nx7NeGfp
         8W52CcD5QBUSzNwUfd+ec1LI77sftMzCstajX3nP/PNqufFYubjNtSqP7E3K/KV6iqur
         T2kw==
X-Gm-Message-State: AFuF++nQ2v00iXxS0UP71f+RWztEgA9d0+PvzHDldPmdytuRxZB2tJFl
	1VCXoc0hLASUj991LWRK4w5SRFwLyuYTUBXjisRnBNeXLfVdm+Pglu7Nmc5txSBrGHjNyIv2UJJ
	zQB4juZrGlaQpPbFQoDM9b10kPtH7WhAfHm1PclG9vQ34hDyCquv9helVkhdlFmBNfaMzSdsZkm
	ELbZM036PpKgY8PvwCZ8bvNDbvDTd4VkDVkywH24sS0FOA0v8of1vWc9rv/BRCUBCDQpqfpv4xp
	XU80w==
X-Received: from dyrt38.prod.google.com ([2002:a05:7300:4f26:b0:30f:2f43:117b])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3cc2:b0:3da:2e53:4f1d with SMTP id adf61e73a8af0-3da3a171cb6mr30624523637.22.1788726549141;
 Sun, 06 Sep 2026 13:29:09 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-1-samagazaryan@google.com>
Subject: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_132911_187364_EEF8D74F 
X-CRM114-Status: GOOD (  12.62  )
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

This series revives the I3C userspace character device interface (i3cdev),
originally proposed by Vitor Soares in 2019/2020 [1][2].

1. Motivation & Production Use Case:
Previously, one of the reservations against introducing an i3cdev module
was the lack of a standardized production userspace use case beyond
controller development and bringup.

We now have a standardized industry use case: the OCP Secure Firmware
Recovery Specification (v1.1) and Open-Source Silicon Root of Trust
(Caliptra) recovery flows over I3C. When an I3C target device (SoC, ASIC,
or SRoT) is held in ROM or bootloader recovery mode, no functional
in-kernel driver is bound to the target. A userspace recovery daemon on
the BMC must perform private SDR transfers to interact with Recovery
Control & Status Registers (CSRs) and stream recovery firmware images.

Exposing an interface modeled after i2c-dev/spidev allows userspace
recovery tools to operate directly on unbound I3C devices without
requiring rigid or proprietary in-kernel recovery drivers.

2. Changes since v3 (Feb 2020):
- Rebased onto upstream i3c/next and adapted to the unified i3c_xfer API
  (replacing deprecated i3c_priv_xfer / i3c_device_do_priv_xfers with
  i3c_xfer / i3c_device_do_xfers(..., I3C_SDR)).
- Addressed UAPI structure feedback from Greg KH and Arnd Bergmann:
  * Used explicit __u64 for user data buffer addresses.
  * Added fixed-width explicit padding to ensure consistent 32-bit /
    64-bit ABI alignment.
- Wired up .compat_ioctl = compat_ptr_ioctl in file_operations.
- Fixed device lifecycle and concurrency:
  * Switched to cdev_device_add() and cdev_device_del() with an embedded
    struct device and a release callback, preventing use-after-free and
    races on driver unbind/detach (incorporating fix from Oleksandr
    Shulzhenko).
  * Cleared i3cdev->i3c under xfer_lock on detach so concurrent/subsequent
    file operations safely return -ENODEV.
- Fixed read transfer buffer allocation:
  * Replaced unconditional memdup_user() with kzalloc() for read
    transfers (rnw == true), avoiding copying uninitialized userspace
    memory into the kernel buffer.
- Fixed mutex leak in i3cdev_read() and i3cdev_write() error paths.
- Switched to static const struct class with class_register().
- Switched minor number allocation to the IDA allocator.
- Added include/uapi/linux/i3c/ to MAINTAINERS under I3C SUBSYSTEM.

[1] https://lore.kernel.org/all/cover.1575977795.git.vitor.soares@synopsys.com/
[2] https://github.com/vitor-soares-snps/i3c-tools

Vitor Soares (3):
  i3c: master: export i3c_masterdev_type
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 MAINTAINERS                     |   1 +
 drivers/i3c/Kconfig             |  11 +
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 445 ++++++++++++++++++++++++++++++++
 drivers/i3c/internals.h         |   4 +
 drivers/i3c/master.c            |  15 +-
 include/uapi/linux/i3c/i3cdev.h |  37 +++
 7 files changed, 513 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

-- 
2.55.0.979.g7e5102b832-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
