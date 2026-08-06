Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE13C55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0nlcVW9MX0dDNOBYZPNzchFp9XnoPshcDDTVhlZbF8=; b=2uLUk9NylaslO2
	16S0IExt9fJbl/05bIYcKsf06/t9vHk86pd6UGwJ67Hi4wfsiZQXcDv/CNDAOivXEyHlsfu+WDfgC
	IC2MNpIKiPDn44mNQg170Dv/HybE6MO4pRJ751tOitYDXsz3VVjNBorW9vrkzNEua6hn4/AYXLZiw
	A6fi2tAyAOKaj+vWkZ+95Z3r1cp6fIKQgCsDg4l5T53Qb1UPdQK57E58hqaTCc8ApggFnDwmWzuf/
	iijfzRV+2bLh8Mm7hvfxDIQIg9ne2RyAyD6YZOJHD8Hq4SBiYHQbdLuMX7xFtd5XIDdf0cHVaiTqT
	M+zsiVDVN7RyJVNK1E1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0N-00000005s3M-1uAG;
	Thu, 06 Aug 2026 13:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0J-00000005ruv-1E8T
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022363; x=1817558363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ABmprPYDSs94JgmPD621KnGiMs78sdq749qZ4lkLmek=;
  b=iV8Q2tSvQTndc5j8stsn/pxLJ4OPjDbjMu0zjIkqD8AgKCN7lyD8ZXC+
   yp4FfjOXWT88jiYtbc93GX1voJCW7DG0mBgICevDF4PpvpyKx4NkpiecK
   bHONQkLCxsQ6UFGLGj3B08du88w2vXizqNCQwqqrOBG/F4Un303Twetwg
   V8PTbU5JoXxBUgfgjY75JvlwgW1cZeAFaNuJWhLm3EUCf1XMwGsi7S/RN
   U6T9SCxAnqKRS5s20nx/FeJpUTdrql2q7UQDP+nIA01tNMUIfI5VZjqK1
   /JP8dwEIw1huKr/kxDFz43JblJ6u5OMqYLQlUgsOgnCCNe1OjNIs8hRz8
   w==;
X-CSE-ConnectionGUID: sxpaT2EnQLOROasfmaWRDw==
X-CSE-MsgGUID: nbgPDVq2S3KFkGBr7vwVbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149573"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:23 -0700
X-CSE-ConnectionGUID: hxxvVUh9TtWk+NcT2tyG7A==
X-CSE-MsgGUID: GBW5ajFkQ7a/wN46BVX+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338139"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:20 -0700
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
Subject: [PATCH V4 05/14] i3c: Make dev->desc locking assumptions explicit
Date: Thu,  6 Aug 2026 16:18:48 +0300
Message-ID: <20260806131857.119830-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061923_337530_F215CEFD 
X-CRM114-Status: UNSURE (   8.42  )
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

i3c_device_get_info() takes the bus normal-use lock before accessing
dev->desc. Under that lock, the descriptor pointer is guaranteed to be
valid for the duration of the access.

Remove the unnecessary NULL check on dev->desc so the code more clearly
reflects the locking rules and expected descriptor lifetime.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V4:

	Added Mukesh's Acked-by tag

Changes in V3:

	New patch


 drivers/i3c/device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index a3778282e84c..5e6df6de0283 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -101,8 +101,7 @@ void i3c_device_get_info(const struct i3c_device *dev,
 		return;
 
 	i3c_bus_normaluse_lock(dev->bus);
-	if (dev->desc)
-		*info = dev->desc->info;
+	*info = dev->desc->info;
 	i3c_bus_normaluse_unlock(dev->bus);
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_info);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
