Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D8C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FS7HkIrEh4nUMPW+frLkfcuWXNAKMMYA0GponsdXAPs=; b=1vGvHKoLo9WxJK
	jhipitBF17c8fFAEqZV2N9GEsuwubVk47+70bjhsMOc+Qer5ct1N+eDnz1jueP3Lxqxy98B1G/rJT
	/L9BO1pYRGTrTpf4Bvod1/GT499X8Y28Qg3A+H3Z9LRzr3S3ZytE4TZ9NqS/O41J0TvFXyl60dtXS
	x5sZC2VJamGkXebtJ1oE9YbAU+9LZevY3gf4laIr0zozDtDrlu5GADFDnoEXsjNNaeqOeRDJJ07jU
	3fQWu7WSwbEhVAOO50W02lthowrooWHr3s04X3A8o+DTTTCq2RYJ1NJ7nsTWNj8UBvlM6T5s0Ok2k
	2R7fOcxl7LpNaib1oh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0G-00000005rys-19FH;
	Thu, 06 Aug 2026 13:19:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0D-00000005ruv-1ks9
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022357; x=1817558357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mggui0CLcJI+CXEJWoxkotbs7prYgBI6zApoIT2r0N4=;
  b=R88RHAFIYvmj126wh3RFuI7fI0zvLFK1TW8HgBOlM0m1Vr8qdDBAZsc6
   Iz9qvHyV4zw5zCvk6O0G2Jpd5pkK45FCcF3NzbxfI+jTDpcKbblIjMNmO
   rmk6b5otGlUGYK+0lpk526kjx7TF6NyyKEm+2tq1exAdSXR7BNFP2Nnry
   qqqhMPGR58Dv3vaoXQZMlJnfREad3BsK7gUUuc2bBMTDJEjq5Z0T7HlKP
   IFe9c3lKJ/d4U5/l1791dDSedEI66pxy7Ai4eiAHVVoEo4VKpA+VuqkGL
   Ikk3yrimxUkkUlDsnYXRhSn7Jt+HU5OpRqTXpIn186prk4voffPL6/l1Z
   g==;
X-CSE-ConnectionGUID: aYIHb5eHQx+HwhGoNmNhKw==
X-CSE-MsgGUID: u9+MLBa+SuKD6WsRJVM7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149550"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149550"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:17 -0700
X-CSE-ConnectionGUID: DIQmaE+GQOuhRgUD+m1RbQ==
X-CSE-MsgGUID: o+XS/H4RSC2+lGKUsYIoxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338101"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:14 -0700
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
Subject: [PATCH V4 03/14] i3c: master: Do not treat master device as a duplicate target
Date: Thu,  6 Aug 2026 16:18:46 +0300
Message-ID: <20260806131857.119830-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061917_487223_6FA45874 
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

i3c_master_search_i3c_dev_duplicate() searches the bus for another I3C
device with the same PID as the reference device.  The search can match
master->this, causing the controller itself to be returned as a
duplicate.

Since the controller is not a target device, it cannot be a duplicate of
one.  Exclude master->this from matching so that the function only
returns real duplicate target devices.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V4:

	Added Frank's Rev-by and Mukesh's Acked-by tags

Changes in V3:

	New patch


 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c7bb52b71d88..abb582645a2e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2545,7 +2545,8 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
 		if (i3cdev != refdev && i3cdev->info.pid &&
-		    i3cdev->info.pid == refdev->info.pid)
+		    i3cdev->info.pid == refdev->info.pid &&
+		    i3cdev != master->this)
 			return i3cdev;
 	}
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
