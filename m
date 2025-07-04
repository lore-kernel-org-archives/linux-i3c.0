Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B9CC83F17
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC3n7t1QdvcKnggbR4D19qlK1LxtojQ0BIjY2YiPQPQ=; b=NtNzAonqhgWeYA
	SBtuBIhhUbIRzBZFzvQrWwnfj0h8i3AMPWjvWA+/pODTUlP+7sWz/Q/N1PHdRa0I+ZniA0AwuPwvO
	SzTvhwSgoxu86rUsjPAyuq2IO9P5YvkVZ9zeiMgewahYe8bgWH21rfWp+IwU5y4PrHPhTq7M/Em2/
	Qrij9VCKCXDu9Ru34c0RBZFFjQnLuC366dL7SH5osouVg5rsB8FpfEa3PqwBdMRUUKoNOlVu//Hid
	ncCdiAIP9w6k2TniRt9o5ursABLouS4n7tb9Ir4cJbaRwkehNAO0DA4QJMsRtbm1ffWb+pHxNuCl6
	jtLEzgo4EtrOWbYHtxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaJa-00000004Np5-3BEn;
	Tue, 15 Jul 2025 07:43:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFa-0000000Dd3y-3bdU
	for linux-i3c@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JUzp2f/EHiEDYLiw6S6LSE0ZZ2Miw2Kjytv8gNLbs20=; b=qOHpx5SJFdQy7LOkwBl6gs9A6N
	ivpjvZbiJZvJh0fE4BqAHKM1wCqM0ieJ+C24gLwkIAyshZnkaeX6WeA3iCA7fRIAM/DNwoiiSRtGI
	3SmGrxSez616oj8nsPDSuIxm4e+xflnfb1O29KXqy4EqnULSdmB4Q/hfkB35t5Ss5pPyJYdC6M9Nl
	wQ3PgTXBEuZb8aqtxlRKWLYc89NXeG3kN421pZOCUy1Dqvb37qbjrAiyFd7v6dp89Tt3OKOvSOutm
	LbmltqrhOVdaWFosy4DFScFfr9QrzHxXOHBdvMXJnQ3dBZD6w1PPuCxcAWoOmlr8HTE7RZAeGWTDU
	hrt2D5pQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFX-00000007pdW-1lNt
	for linux-i3c@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615663; x=1783151663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q2znRzlNkp1VX01C6C6SWFWs8cikijZSrtuwfc3vXfo=;
  b=IkJzONL/4mLoRXhhGhdOV0rzBoGUVKW+uWfMy3xi4bd8ms0GkzgoSBM1
   mgsoQncyGIA08UuWASIAzj0Paz6mM2FRR15CjSxmmclSqFGIiSt/oNTCq
   SzlHtTQhD+U/+RydLcxk1TyghxPviPpuqLhcsHyEQfTgV46dL/jjh9GGs
   uHrgdjq35QAM4WGGQ/gVjNppbX2nAiRCuiZtFJG7A9ci6mMvOCJ5N6R5w
   5tv7BVXJi5BCSpaoFLWRjOMEsdqPhfqYW1ej61o/LwkRv1Cr8lfxT5xy9
   kvwLBqFWVSI4NSHLrwEM+Dn48cRV/Ap8Gmrmt0oFOFaLoidcPPw9Q+KPc
   w==;
X-CSE-ConnectionGUID: MhieoBSoT2eCNt1H8q+3DQ==
X-CSE-MsgGUID: STcRzW1JRQ2arETGv1GKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494585"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:22 -0700
X-CSE-ConnectionGUID: IUennC47Tk2lCs9hia+Stw==
X-CSE-MsgGUID: DVXgBXKdTmiKM3rSFP38Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924252"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:19 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 90C7344424;
	Fri,  4 Jul 2025 10:54:17 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Aniket <aniketmaurya@google.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/80] i3c: dw: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:17 +0300
Message-Id: <20250704075417.3218742-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085423_995740_15DCFABE 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 15 Jul 2025 00:42:50 -0700
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/i3c/master/dw-i3c-master.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..37bee9c21736 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -699,7 +699,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	dw_i3c_master_enable(master);
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -829,7 +828,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	else
 		ret = dw_i3c_ccc_set(master, ccc);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -912,7 +910,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	dw_i3c_master_free_xfer(xfer);
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -998,7 +995,6 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -1148,7 +1144,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -1316,7 +1311,6 @@ static int dw_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
 	       master->regs + DEVICE_CTRL);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
@@ -1342,7 +1336,6 @@ static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 
 	if (rc) {
 		dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
-		pm_runtime_mark_last_busy(master->dev);
 		pm_runtime_put_autosuspend(master->dev);
 	}
 
@@ -1362,7 +1355,6 @@ static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 
 	dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
