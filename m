Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBDEC2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPFR5SM5SpZl6FtEP8W48Z2/zyNr0odBv1hjoLyKlm4=; b=kLcy5Fym6DR6di
	aNEYkHcXz0toD+nvR4xqSiPCbwyRGGQfQe1MwGm1868PMzTEDoqjMU9jLGJyC/BLL2yy4hAEDhyD8
	zbx0ag0VC3Cr4/1MfR2qX/QPhjkeXXXD9i68fP4BLEYud+cwZn7Hdmwf87hXtpbbbqo8loo3w2Yjw
	s1pIZBvgvGgHdexpTZOEcCg5sBQTWRGJzjRzu+xulEiMSJwxu8pypA9F89wNI8VB0oS2zPA9T/PDt
	mtAzVdkajc+i5ACWJVqp23AwpD735VtryAY3HlMnAKNPqzAhXv+wfC9Olcg2hEK3PQiiMoKQoAyLK
	2CX3PcK0h8oWPK+l/Lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM12-00000008Ios-0kX7;
	Fri, 07 Aug 2026 14:57:45 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0z-00000008Ilk-2145
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114661; x=1817650661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6kbZmNFhv7aKt6TdJXjjhnORc9iTFg+AGsRdFJWwHEs=;
  b=Fpe/Y1fG8HxVr9G4yVJl4Yhn7gdnHIG8BmePivl4dKSVsKCRnxoQiMxB
   zekpe7Z6P2RJLidkgZUt+r/bluTznWiNHpItVT7DDqBZwv0iPunBldgRS
   U/cLP0MamW03m222zpIoe6Rj5ero0zMREpeSMy9Aef/+JtGOU0U26lkie
   2HFVcOJXlr/M+Hk21FIlHRaqbMNy9ogwMFihrUbLUMjr5vESvr3vee/Ek
   B8V3bz9Fon8kP+ux3YpUn9m03SmQycsHc8otsCSLkyGAi/omwT7hTC2Q9
   fAfb8YtTVqBwLIevOIQt/TWgjBPcni9hEFVyb6QO1EJaEhcYn0oIV3kdb
   A==;
X-CSE-ConnectionGUID: 3KZLtWWyTqeD5grnpi5/UA==
X-CSE-MsgGUID: rRrTOp8BS+mQ6lkjPxzTIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485246"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:40 -0700
X-CSE-ConnectionGUID: Q79F2LcjTM68E0/8njSe1w==
X-CSE-MsgGUID: wM5X+FphR5KikkO78S22ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809941"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:11 -0700
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
Subject: [PATCH V5 09/14] i3c: master: Report wakeup events for IBIs
Date: Fri,  7 Aug 2026 17:56:33 +0300
Message-ID: <20260807145638.168865-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075741_561680_4BB0801C 
X-CRM114-Status: UNSURE (   9.19  )
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

An I3C device configured as a wakeup source can wake the system by
generating an In-Band Interrupt (IBI).

When an IBI is queued for processing, record a wakeup event for the
device if wakeup is enabled.  Use a 100 ms processing interval to give
the I3C device driver time to process the IBI.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

Changes in V4:

	None

Changes in V2 and V3:

	None


 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2616354dbe54..6c5341491944 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3384,6 +3384,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/* Approximate time for IBI handler to run */
+#define I3C_WAKEUP_PROCESSING_TIME_MS 100
+
 /**
  * i3c_master_queue_ibi() - Queue an IBI
  * @dev: the device this IBI is coming from
@@ -3397,6 +3400,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 	if (!dev->ibi || !slot)
 		return;
 
+	if (device_may_wakeup(&dev->dev->dev))
+		pm_wakeup_event(&dev->dev->dev, I3C_WAKEUP_PROCESSING_TIME_MS);
+
 	atomic_inc(&dev->ibi->pending_ibis);
 	queue_work(dev->ibi->wq, &slot->work);
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
