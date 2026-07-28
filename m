Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7277C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AtRjarXIqNw4z/MAl4Y/H0Tvq6PQ2Lds/ILdy78cng=; b=u5U75fFxBISfTZ
	ZTnrD7QxtwxeY9E4vNfmibe42Fxswm1/7O0OcF9HHP62Pn/8ylglAixyzRJh0W0OANRfBd2ID68mm
	K7Y1117Lw+W2NSpQOxDIump7phwo2tIXbRZrFGg+BG7pTTgxZZE2T2voPcP5tHYqZuWGh2Ddffg3n
	hRQ13CrGeAViyAgkIZEd/mnHFbcNBKHBUBkxihxX07WMK9jrxAVZTGYIhBTlrJfNrgXJunmMS5t54
	EluQXnPd/5lCDiY46BwMlJ/TlRSkkv7kD+BQupc5ake40BP+eMdTIGaS6E0wl7dn/qs7pQfQZHEXV
	J9+N9hqzWMxahFAymKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7W-00000005jGX-1Zp5;
	Tue, 28 Jul 2026 15:53:30 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7T-00000005jEm-3rBd
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254007; x=1816790007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rs3eLDm/z0MDQyS8v2EoxoDJjXfLNNwsxGZf+12I8AU=;
  b=YBm/c7M4Nm4QgbcrWdQpnRnEY/WuxEjkhuanXTgltGmIxu7swhCBtkVH
   oa1wcgP3eDKdRZlK38JuRp8hmeFFufHztFdPscksoKOY0vyjPAouaRACs
   /Umq441W0HUMuxGVStjcpJ30buPHr8+VHgNk5T3dT9ons6f9WxgER7ST7
   /SMpglkALoWBXakY90VOeedZZuhokvBNnI82yX84A7QGR+3blkfmF8mKe
   MetaoU6UxWwuJG18u9YweCJWwJ1hDxvfkUZfxjDWUVZbM/JqSCsM93UO0
   u8XjggEUT6HuXJr027DuOQLdZXK2saDpkcz8nG882sWfVf/mcWWJwYvAi
   g==;
X-CSE-ConnectionGUID: jNOPl8PvRDef/9/W5VmSzQ==
X-CSE-MsgGUID: iQuSHXh3R7azSVnELlxL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696575"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:27 -0700
X-CSE-ConnectionGUID: 4SQ7yB0wR32ZjYvt+EYDFw==
X-CSE-MsgGUID: 97EhECoDS9isdhJDyCVbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817524"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:24 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 3/8] i3c: master: Report wakeup events for IBIs
Date: Tue, 28 Jul 2026 18:53:03 +0300
Message-ID: <20260728155308.142713-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728155308.142713-1-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085328_044114_E4F58ADC 
X-CRM114-Status: UNSURE (   9.63  )
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
---


Changes in V2:

	None


 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index cf3345265ac0..9d56ca08569a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3085,6 +3085,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/* Approximate time for IBI handler to run */
+#define I3C_WAKEUP_PROCESSING_TIME_MS 100
+
 /**
  * i3c_master_queue_ibi() - Queue an IBI
  * @dev: the device this IBI is coming from
@@ -3098,6 +3101,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
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
