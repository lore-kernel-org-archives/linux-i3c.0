Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E91C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRFPeXrwFZkScTHeK6uBIPFVsQfFAtOVgguUDRzj2x4=; b=yM1zpnC5+azBQp
	6nqHhPXFIp32kx26pl4MoItox/0f92EL74uwZCkMijeW9BpnuMZbvYpwJXlm5+Ed2J36xN6yKhSGU
	xlt1P4sYdTwKC8q9vY6QV6f6e6Y4qI5K0+EZL0IwCTSlRCwxwZKj/P/vQjfn9qh7WOmuo71mkrTYO
	Yeh4+mGBGdaNpLK4BCbe2Ulvjdu0Oc7yYjWHwTelEO1T8A7f+dgRIDHZogl6iRcx2Kqd/EcVaK19j
	xV97HuTT+/YCHVJJGK5mFVTLIl2nxpgUcAUkElqQRO687p9PENqA9wiBoUwAZutWzz80QQ+z2lQkV
	U7qiClknxVGTJpe7Z14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0y-00000008Ilh-0FtW;
	Fri, 07 Aug 2026 14:57:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0v-00000008IkG-14JP
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114657; x=1817650657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PoBnNTY7R/7wvVAa6p1CUs45T33ETASB2I+FQ3ox3a0=;
  b=k7zOD5p0jKPI4yAwp0LIlpwExflqX4m7t5L2oo8hSkwapRxfY8E39bPN
   8KUheBvTUj4b6U6uFhEiH/UVvublwvB20XiBDrVCzziOZwpqKnzl8DtFy
   MQPHcEgJ7bGeDMIrKIB3vWEyMR2zQtRJERYqsHg8O0Y46syz2W3Vhmsjr
   I00wHSmQpDfIDmFz5pjqJ5iFTGexh+P1tJhPzBWHtNBVCaZt1gVchz0pB
   ZlAxCR3pZYoTnIGksdJgS2XlhPa/ZlB/5//ORh7tI0x518A1jhqHdKNcE
   Ngwu5Da4cnxKMohcH80uKETEbQPCgoP3v8MmqwIA+15ONVZJIYEtKIbzD
   w==;
X-CSE-ConnectionGUID: O+OWv7kHRl+3/GZP0T+D+g==
X-CSE-MsgGUID: jJ79IgK/SiigYQrBZiMEyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485227"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:36 -0700
X-CSE-ConnectionGUID: fcbCQuZMTpCidWeSh80EIw==
X-CSE-MsgGUID: vrqrhy+mT5Wzk+6M8ae88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809898"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:03 -0700
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
Subject: [PATCH V5 06/14] i3c: master: Fix potential UAF in i3c_device_uevent()
Date: Fri,  7 Aug 2026 17:56:30 +0300
Message-ID: <20260807145638.168865-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075737_334968_CE56764F 
X-CRM114-Status: GOOD (  10.13  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

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
