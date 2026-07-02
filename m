Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3ACC43458
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jul 2026 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ayMn0rdjCuwsJV6aDsoPQFZSZEFmqIpA4Kdq/BZu1LA=; b=382B/iS9B30MRz
	1kYeHGZ7Wa6E2AqIRbWJ/MhQMFlJfUvS1jriTQuEK7CanhoeigDejXBbr8q9bKsuvUX3xZ3ARtCi2
	CSx1bRZZ7if1bhcq2Tub+MTltcWQryPHBmNpP37g3ChpitDGzD9dmmbV43tqcEDT1Eyb9djNBYiZn
	TQD6tM3GUio32iNIu/GD8j5qgOt8gQf1a6OCe4cgByc4o3WuU1ndhjdXQPbBHph1PSsjYKUJko0m6
	HYfXHeZbHTxkcJlBfA3QReli6lD8vgpvev+ob/eWQQafrT+ZwcSfO5hGgrpXn/u8uayFmMD5FZwCS
	rQ0jzhl8jt9/tx82a3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMIA-00000005HJg-2v0X;
	Thu, 02 Jul 2026 18:37:42 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMI8-00000005HJF-1RIc
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jul 2026 18:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783017460; x=1814553460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WlF+EcDXIqVMvrgbpCi5caEF7jFuZx8Z2utDNtPTcHQ=;
  b=jWrEC2Vc+zw02pgC24xvhQf186sDWRkJlaRGvQhe5jpUAr3VRQy08xvt
   JaMJoCTapAXr1wS5w6UcIUB8E0R3zEHyVeb1ilx1uAXnnbXnFQUEOweT8
   8vqKQk/DQLXB17nPbz2RSy079WgAa3RcZqigMtkijuIuKet5Zf55QEWfi
   +faPKfFl9umzunqvS6caW64SM+e8/us6UphfUVBCgkyBX0EvDWCZVp0vt
   czqsb2t+l+Bg9J7t5A3AoHt6CZR2W0wHYExsYiW0xvYFVyG86n/QJWMmE
   lXBE3XSKmjEAn5/9L2dJ66ESYIclElIZ2wkSIB/QCFuOlKVc8w9uFu91i
   Q==;
X-CSE-ConnectionGUID: bQkgAPQ/SN2BhTOAoZeBhQ==
X-CSE-MsgGUID: TpUnHRr2STKV4wfLO9x4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71299013"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="71299013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 11:37:40 -0700
X-CSE-ConnectionGUID: 39dVX7EoTqSWP4QmvgcU/Q==
X-CSE-MsgGUID: BsyYwALVQOeH/nlgPCfWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251860180"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.196])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 11:37:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: Fix device_register() error path
Date: Thu,  2 Jul 2026 21:36:44 +0300
Message-ID: <20260702183644.60827-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_113740_437652_860D9BEB 
X-CRM114-Status: UNSURE (   7.95  )
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

When device_register() fails in i3c_master_register_new_i3c_devs(),
put_device() is called to drop the reference taken by
device_register().  That drops the last reference, so the device's
release callback i3c_device_release() runs and frees the i3c_device.

Two problems follow from that:

i3c_device_release() does WARN_ON(i3cdev->desc), so it warns because
desc->dev->desc still points back at the descriptor.  Clear it before
calling put_device().

After put_device() frees the i3c_device, desc->dev is left pointing at
freed memory, so clear desc->dev as well.  That prevents, for example,
i3c_master_unregister_i3c_devs() seeing desc->dev as non-NULL and
dereferencing it.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/linux-i3c/20260701203053.8F3971F000E9@smtp.kernel.org/
Fixes: cab63f6488761 ("i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 979457e635bd..7254b13fe4f0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1942,7 +1942,9 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (ret) {
 			dev_err(&master->dev,
 				"Failed to add I3C device (err = %d)\n", ret);
+			desc->dev->desc = NULL;
 			put_device(&desc->dev->dev);
+			desc->dev = NULL;
 		}
 	}
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
