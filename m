Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A24C2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YC+FjSmxK8FZiRXsMyCQGkWDvxq65FfbGhx/K0llJnE=; b=i/l+eFERMP8l9j
	DOur21w37sUvS/i6rtvbJRDSZ+taNjiTUp5b8rOqVNtw/fUmOGCjbt31UOYueP8NeiZnr5g5lHBog
	x4LBUZPVUNM6HeiGrLQTlEAE9ErJ8Bozrex4yN5spboCPWSG8sX1auIlI16RXHoOLWLmy7YDRetdR
	XbZsgxtj8pavazxs6Nd2q8ckJ0BABoZlTXTAiX+XeeI2aXXOhQBWSABiqWUedoSHLoEaxTvfTVa4T
	oPwqncRiuGBtbtR0wxnkw2rhvcVcWBnJAoNw6JskPROL7UHc+M6E6+wc779NLjK9a7ZnvfAabAoMJ
	SDQr8ejEBAxrDTHRbQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0r-00000008IiZ-3XJY;
	Fri, 07 Aug 2026 14:57:33 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0o-00000008Ifs-340I
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114651; x=1817650651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ctrlY3FM28tivUxIv2sCpxma8DQO19RH1AD6gnz/0ck=;
  b=JdQdPCrTC6nSs8zF7QjL4kVxlgvxr1IDEOf6CR0KPIB+qmxk2R5K3J/P
   JRhXbyHwwk4UKBiYAfBLBlmS4VFpsUuEJSdfppBcP7RsB+44ZAxQcAerj
   8FtWJaUDcGrYm8z3p6BOTgUatYadBmS5PwKCoZof9niUoIFicSwT8Ttb2
   /33nweWCQU+uPwMA4dZz6bmmv6YyEY+3vXUqtlCCcAY9aIhFM7qtd5UV4
   mM5Kl73SG0q9PtrJuZCJkDhPsAN9VvoTfZa4ieVfD52ZlMbSdMkspRo6/
   0ppTQ8SecDDl/n9kXnBIpLNoc58pdK/PHwRocMQj26eS3AkP3xfZYiWVg
   Q==;
X-CSE-ConnectionGUID: 5Ngy1cQiRwaC/UHKbW4ZKQ==
X-CSE-MsgGUID: 1wzLnVRWQBSSdoYnxNsMnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485193"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:25 -0700
X-CSE-ConnectionGUID: JLBFR8nDTG6LJmPzP2Hqog==
X-CSE-MsgGUID: vwoskQALRtORVlH9McSGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809880"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:56:54 -0700
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
Subject: [PATCH V5 03/14] i3c: master: Do not treat master device as a duplicate target
Date: Fri,  7 Aug 2026 17:56:27 +0300
Message-ID: <20260807145638.168865-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075730_809113_FDAAD172 
X-CRM114-Status: UNSURE (   9.88  )
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


Changes in V5:

	None

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
