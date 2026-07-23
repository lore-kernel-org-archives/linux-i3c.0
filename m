Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F3C44524
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RDSDyLInZNQcq6scUSvT+DJlMZ1igocGenL5iBCEjOU=; b=Dr8JIU9QPVxEj9
	E3FnetwjfoWYyjJ2N6dNK6S70YIb00Lc6vVFYngRozW5rT5yDx93dApXMcMgObtRiChvKoxJNRno+
	T84yJ+bAc6Inw/WtQ4Ut6aLPGgnUXu+UPvhCQSGMaWhK7C/CF6BmYTTLSw8us/W01nk1U2Ik+Dqo7
	jYwUBVzOMjWM5Etlzqe03CWpwxbb6cNL82O1LXCl0xB0S+j+siamHw6TAkRVsLB/xCFFjvINYoEXE
	xiAyjsVrsiGDsvxG5v+sdfZybREcV/NSRQ+YiTt8txYI2RnSsAEMw/qu0xnrcsRq5s8E/AU/EMkqL
	vIq4LmgEyGFAAYbgBpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoJe-0000000DghK-1buc;
	Thu, 23 Jul 2026 07:58:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoJb-0000000Dggh-47u3
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 07:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784793480; x=1816329480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LKOI6uSG3dL2yOV0m+FoJKGUuLse/gsfHXWoYSlA8kU=;
  b=QmQkv7qRHpk8l3VxjAAJotBmK/0vt5PIzZPzRv/i1BK+F6erB7hyfUmr
   HTHlsgsSvtx7m0Zar72hNx4uenkjG8BuTW3B3sY8MGnQrC5JjrRvmsXOD
   JQXkkm5z+MJ+YAO6OjkPaEWfWTV6955GpFaOr2EEHJQ5L4hshNInhwQq2
   N0RUwZY04VBr9+8A+ASiBQtB+DH+XALuwSU2bnCrFTm2B76Q/59xnH7an
   QhPi9I9byYPnSEf0S4i12g/1lWGocngl69ebHaZNnO4Cqi1UL5sWfRSYh
   VqBA0bkSnwb6uaOdFQh3jk91EKQB6qVPdj61DPA/sPRDh84kJnbkQW7cz
   A==;
X-CSE-ConnectionGUID: zNHAgOsISzuxpeiVhhnLyg==
X-CSE-MsgGUID: YJG3B6TIReuCVVStzPaQBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89118939"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="89118939"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:58:00 -0700
X-CSE-ConnectionGUID: HmPL9I6lQD2HGVtplEbX9Q==
X-CSE-MsgGUID: 2cmtYmoNQ3eTCUEW7NXEJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="260297709"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.244.59])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:57:57 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: Fix info leak and UAF in device unregister path
Date: Thu, 23 Jul 2026 10:57:47 +0300
Message-ID: <20260723075747.34049-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_005800_098181_5CD4A51B 
X-CRM114-Status: GOOD (  10.36  )
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

i3c_master_unregister_i3c_devs() clears i3cdev->dev->desc before
calling device_unregister().  During device_unregister(),
device_del() emits a KOBJ_REMOVE uevent and unbinds the driver while
the device descriptor is still expected to be valid.  As a result,
i3c_device_uevent() and a racing modalias_show() can observe a NULL
desc and fall back to an uninitialized stack struct i3c_device_info,
leaking kernel stack contents in the generated modalias.  Driver
.remove() callbacks may also encounter an unexpected NULL desc during
unbind.

Keep desc valid until device_unregister() has completed.  Since
device_unregister() drops the device reference and may free the device,
take an extra reference with get_device() before unregistering.  Clear
desc afterwards and release the extra reference with put_device().
This preserves the release-time invariant that desc must be NULL while
avoiding both the information leak and a potential use-after-free from
writing desc after the device has been released.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/linux-i3c/20260702190003.8BF741F000E9@smtp.kernel.org/
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 659c14c2c192..433dc7531701 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3083,11 +3083,12 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 		if (!i3cdev->dev)
 			continue;
 
-		i3cdev->dev->desc = NULL;
-		if (device_is_registered(&i3cdev->dev->dev))
+		if (device_is_registered(&i3cdev->dev->dev)) {
+			get_device(&i3cdev->dev->dev);
 			device_unregister(&i3cdev->dev->dev);
-		else
-			put_device(&i3cdev->dev->dev);
+		}
+		i3cdev->dev->desc = NULL;
+		put_device(&i3cdev->dev->dev);
 		i3cdev->dev = NULL;
 	}
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
