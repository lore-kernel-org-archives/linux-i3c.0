Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD48C55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=646tV0WjevXeBuTfbDT74F1cSDBCry8dsIPyxnNQ06c=; b=yxmZjxtczeZkHC
	b3SlFMi17j44AOVSGzY9SSETohSOIRXxcX5oysYA+iQ/XVoyCdbVeVaDRhT7Sr21IvFYPgc0RWfRe
	tzFScw6fTuJvpVhvv7+5I/B06lnDzZ9Ai9XCcyV4ZLO1Sd11Vq3BjknAgS8ufBXCWUYJTcLMh8s3E
	vOJj9E3SQDUSbGqtQO7l2d+UR5rpJGGR/7TfBPtnSYub4JHjTIS4eW6NgYUSvIxj+rMwRGpIOpu2g
	PIStUA1y8abQzBz8bHCnEeSbOFV9lmugNr7Q3r1rKB/XJqtr1UnG4hwiBFxKZc5WJyHyL8Q5rLHET
	XKpTgwxNx9GB6Yr1a71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0R-00000005s5K-2Ioo;
	Thu, 06 Aug 2026 13:19:31 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0Q-00000005s3x-0dIl
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022370; x=1817558370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRpafqq+wNMr/EYQqjCT5QMFngA9hTqwKopSC/ZJKuc=;
  b=OROVv63yPS9LOjYLpWu1VBRnB+kVyLgckEeso1vMAi1gNKY/0BkiBRpk
   9wi1CxNaP0bL7VofUgTHgRx9H5kOhWMb3hI/tAQfnibbNiBBV3w86t1uE
   7/Tw+yClObkdadd8d4dNgxu5JR6ubpDf55qRTh+jgSwY31lzbbY4KGVJF
   f6wwU1FSBLxvFybPXzEdUYJ9U+D7mfVlDBx2DYYecHnQKTU7RQq4pB5L+
   0kUwvcVlApY9Wwktvg9OPakMEwgywTDnQubBUwD7R7UHJL6A+fvqjHzOr
   QD6DBGnenp01hgz2S3V9BlI3xgANpsHHqKbXbQYAFALTNyo31TPHZk5Xp
   g==;
X-CSE-ConnectionGUID: lu6a6TRyT5qUYVbY6kR3sQ==
X-CSE-MsgGUID: cefpcC1uRjeNwwFX9LRM4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149596"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:29 -0700
X-CSE-ConnectionGUID: YwbflQISQ5GUyI0E/WfZEA==
X-CSE-MsgGUID: /fyyX5WEStKvq9ym9PXVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338186"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 07/14] i3c: master: Fix potential UAF in i3c_device_match()
Date: Thu,  6 Aug 2026 16:18:50 +0300
Message-ID: <20260806131857.119830-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061930_197465_30635E56 
X-CRM114-Status: GOOD (  12.59  )
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

i3c_device_match() dereferences i3cdev->desc without holding the bus
normal-use lock.  Since the descriptor pointer can be replaced
concurrently, the dereference can race with descriptor replacement and
result in a use-after-free.

Protect access to i3cdev->desc with the normal-use lock.  While the lock
is held, the descriptor is guaranteed to remain valid, so the NULL check
is also unnecessary and can be removed.

This change depends on "i3c: master: Fix recursive locking during device
registration".  Prior to that change, taking the normal-use lock in
i3c_device_match() could recurse on bus->lock during device
registration.

This fixes "i3c: master: match I3C device through DT and ACPI".

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V4:

	None

Changes in V3:

	New patch


 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ee771ac0b203..83e04a2c202a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -347,8 +347,10 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
 
-	if (i3cdev->desc && i3cdev->desc->boardinfo)
+	i3c_bus_normaluse_lock(i3cdev->bus);
+	if (i3cdev->desc->boardinfo)
 		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+	i3c_bus_normaluse_unlock(i3cdev->bus);
 
 	/*
 	 * SETAASA-based devices need not always have a matching ID since
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
