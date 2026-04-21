Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD61CF94CA4
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QaGCSYiUnGTR6dZLgBKkrqknQ3fp22BOsGbFi2SjdA=; b=Qc9RE5UXUY5sAQ
	PAJXj1H5UgimTQC/aLz9XeCSy7dO5h96rr/0bJtqhjltP+x72r7WIPMMHJKaJTbsIKWwozcjXGnuc
	bSDzts7FWWzFnD4EQj9PQ4S3twJJrj/hpG6i7D6gdGQ6zouIgwa5WfRiciNsavaeVljPWA90gY9Fy
	0hzUttsvhX/9F9YKppHqqreAjayseF53fLMVci0z6eYIF547PlvZFsRhfS8ojeddWY3cWS0YKa736
	nmzkhgYNveS7jHKUDysfkKcTDhRbOH8mB5pw8Gf9pwD4ujC2yDFj/BKq2MEsks/bVMi75S+UioMS1
	pAadRDkE9ANz+UGU918Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJi-00000008zlp-1xWW;
	Tue, 21 Apr 2026 17:55:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJc-00000008zif-3DHA
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794117; x=1808330117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpEY96fL+nmr8av+bIMbFv4/Mbf49/G5xKR0aiomEKQ=;
  b=KlJnSL/LX6iXaWzPPH+aPSlMuBVZFEkw1nIQblJesDvvgt4jNMVea18J
   BtvTtAO0LIlLFdzMdxenzWXqs2cSV17xTQlAsnVzPc909zaMkgpk3ZU15
   5Im3wa7R52XJRR3ur41foGe35YKM3/g7P0BB5xUbPeLGShxcCdRW6t/YH
   E29s9KqgR5CoLEnQGXuj2KSh+5WTNHvdLJrt15AzPihWzoRgaviy6htsT
   YS0pAbfEmSJEGlzCbfTHtRzFc/IisrytB1wUW1RpwRtt4N5+NaC2IQ6B+
   4bi7ToU9Vzt1eDQtKciSWhqmsTg1EvySOgWYI8YP8nvDei+D5XC6C5CC7
   w==;
X-CSE-ConnectionGUID: 1X5CsR0FSemyBIGggPp64w==
X-CSE-MsgGUID: rKkm3i/RQPqgfGPe3BAgqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651443"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:16 -0700
X-CSE-ConnectionGUID: IOJwsHPMSp+vghN35tFTuA==
X-CSE-MsgGUID: cm5wJJnhS1Cr0nQslXuHkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227495095"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:15 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 16/16] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
Date: Tue, 21 Apr 2026 20:54:35 +0300
Message-ID: <20260421175435.122094-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105516_908725_6DB89746 
X-CRM114-Status: UNSURE (   9.37  )
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

The DMA transfer ring is currently limited to 16 entries, despite the
MIPI I3C HCI supporting up to 32 devices.  When the ring lacks space for a
new transfer list, the driver returns -EBUSY, which can be unexpected
for clients.

Increase the DMA transfer ring size to the maximum supported value of
255 entries.  This effectively eliminates ring-space exhaustion in
practice and avoids the complexity of adding secondary queuing
mechanisms.

Even at the maximum size, the memory overhead remains small
(approximately 24 bytes per entry by default).

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 73fd86b6fb17..3d8fa0e5ed67 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -27,7 +27,7 @@
  */
 
 #define XFER_RINGS			1	/* max: 8 */
-#define XFER_RING_ENTRIES		16	/* max: 255 */
+#define XFER_RING_ENTRIES		255	/* max: 255 */
 
 #define IBI_RINGS			1	/* max: 8 */
 #define IBI_STATUS_RING_ENTRIES		32	/* max: 255 */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
