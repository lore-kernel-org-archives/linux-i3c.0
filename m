Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2842C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9cK8cQ2rMF0OYHEutHrbfGtH3ucGBE1XNlvcFEb6Ks=; b=jrvJpxyVDlLBe/
	M+Cx274Lt49rrlf1dp+tP9nxjPuvoABboWpTR8ZjaEs8QfSqATa+mdUAj9RVA+JVKfGIn3kQMK+Zo
	XC/sRLqIvb87N77/o9fCLF4kmQ5QTmLJ6SHBM2M+AgBsvOf64huxdPyCacCsEvSmXsmiUshkq8qvr
	eyMcJWTx+Fsz5QGZ2tYVAXVuNnEGcPbQzj83cPLWiXbg8+G9T/tEXlQkJS49qbC4+Xapbhq1g23yW
	mgSc6XN0lnXxbOXHf5LfdR/Sj+pVZDjadA8yiTECV63sLPv0GwnrlwF+oq+cH3wue45fb0x6GY0pe
	N2/c2/N4PGb/hXtU0zRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0O-00000005s3e-26NG;
	Thu, 06 Aug 2026 13:19:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0M-00000005s2e-1gZH
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022366; x=1817558366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HlQruraA7agKiqxVYRqDPlUkqImO4uUYgYC2j57DVk0=;
  b=jiYf80k5GP7nWPhUh4RhaZALZ4n29/cwEvJGU8V7dXwPVzp/Ws6mOrRs
   M7VbSAFy+yc2VNgDPdoqeif4PFxzXo59WjK567p0bKv1GN5pNQW53nSJS
   L4EN9Q3noUh6u9n+sL/EfEPxq+n9zSTY7EiYCnz5CsmRzM1VT4OlRliM4
   umY81eRP7UUJcFPlumuWQqnudaf9G7ubrHfl80hgJc98G/6fWlXlaNmHY
   Eb9ttnMEGMLWGnIwfs5NJwJNf5+b3Z5kN+GiwycLsw2XEyaVBbPwnHTyE
   UAC+xLc/AFdISKvjcfKJ7fHdHrvOKT9RcA6md90CHwQHXBv2Do8ECwqqh
   Q==;
X-CSE-ConnectionGUID: Nd/kp1mpQSOuMuZOZ38h/w==
X-CSE-MsgGUID: tpqvRD7YS4OaZ+wvAZF0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149584"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:26 -0700
X-CSE-ConnectionGUID: ECrO4ecXS0atukBeJI+Grw==
X-CSE-MsgGUID: fXyMbzWIRK+RDz74/dKaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338168"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:23 -0700
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
Subject: [PATCH V4 06/14] i3c: master: Fix potential UAF in i3c_device_uevent()
Date: Thu,  6 Aug 2026 16:18:49 +0300
Message-ID: <20260806131857.119830-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061926_451534_FA6350F4 
X-CRM114-Status: GOOD (  10.53  )
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

i3c_device_uevent() dereferences i3cdev->desc without holding the bus
normal-use lock.  Since the descriptor pointer can be replaced
concurrently, including when a uevent is generated from sysfs, this can
result in dereferencing a stale descriptor and lead to a use-after-free.

Use i3c_device_get_info() instead, which protects access to the
descriptor with the normal-use lock.

Commit 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling
i3c_device_get_info() to avoid deadlock") replaced the accessor with a
direct descriptor dereference because i3c_device_get_info() would
recursively acquire bus->lock during device registration.

This change depends on "i3c: master: Fix recursive locking during device
registration", which moves device registration out from under bus->lock
and removes the possibility of that deadlock.  Without that change,
restoring the i3c_device_get_info() call would reintroduce the deadlock.

Fixes: 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock")
Cc: stable@vger.kernel.org # requires "i3c: master: Fix recursive locking during device registration"
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V4:

	Added Mukesh's Acked-by tag

Changes in V3:

	New patch


 drivers/i3c/master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2357874bb9d6..ee771ac0b203 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -316,8 +316,7 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 	struct i3c_device_info devinfo;
 	u16 manuf, part, ext;
 
-	if (i3cdev->desc)
-		devinfo = i3cdev->desc->info;
+	i3c_device_get_info(i3cdev, &devinfo);
 	manuf = I3C_PID_MANUF_ID(devinfo.pid);
 	part = I3C_PID_PART_ID(devinfo.pid);
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
