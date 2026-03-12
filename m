Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B50C106ACCD
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeSoildGQMHtu44J/CeONYxlfCIB42i6xK+CnvkOJBU=; b=jf/jjYnany9Di3
	cvHsahpqOGQeSJhvAOV5FuV1ZmITmBwAFIOhXGuIhinxukQ6CbZ7mVsqHaU+Oqb8JedIim8pAfy+6
	UMEdknr6xyoaMBQM9SSDfEE2hF12yCCtrN3BH5lAhJkuIhc/Hg6jP0i+3WXKB59EKhh0pDEbrERoN
	wrtIPrD7xxKylcg9TMsyb57g48WH0xAB9TlCWo93KIfz1KYHsxzsyygqJX/7fl/60Yb9KAa/QwTBD
	pgcXiqXsVaiwkf9kU2X1nK0mlWLXLrX8muAddLqDloFYOP/s16GlWwKCT+QHvFBV/bL+NLLgPDgwi
	/7SnGXmPRhsiUEsX5rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3e-0000000EalO-06ge;
	Thu, 12 Mar 2026 16:38:46 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Z-0000000Eagl-0Hgj
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:44 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CGTwih030488;
	Thu, 12 Mar 2026 12:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=VYEti
	fmAA6GoQD66rFpZEOS/mBJCrNQ5cDAhNFtM21w=; b=HIIX3/qQN5k1KACG9o8+c
	j1ZKL/U1RjJMvmm6JuF95JzDSOrXJ+0kgINP+UxNDr6sylPOYD0nvFlz9GHGo29i
	5vwFDRpWLK0fc6UWyAy3Db6esGgnpQ6H1/IeXBCLPimDweM978EdmxfUyoMLzoqk
	xhevwbjzg4VzL+dKPincqg7Avd/Vz83KDntP9kjnbt5aoqdemwd3cSzrxvy80pVd
	Cbiry0Bej038YtA9x8KvcJS0Cc0FoD7ZUqAXiTw/ZL9hespP7t0TjmBoqQzstgCS
	+tiKtBQ8RQ7gYXXgsuj232QKVqr3RhvrF8/0BY5mHgg/9GyiXZvWxJe22+zSLjSH
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh763ehj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:29 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcSGe009200
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:28 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:27 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:27 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:27 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8Ga021063;
	Thu, 12 Mar 2026 12:38:20 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 12 Mar 2026 17:38:06 +0100
Subject: [PATCH v2 3/5] i3c: master: Move bus_init error suppression
MIME-Version: 1.0
Message-ID: <20260312-ad4062-positive-error-fix-v2-3-1c933b5c7ed8@analog.com>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=3314;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=QPiJT+SgAegv8Qe7r5mUnpu3bTWGbjpMxw9UXCHYdCA=;
 b=ELKvG3UjOkirSINK19PX1o2qAu9RjO5Mesyq2PMFRtM5zfdysaBr4WCebMQu7k3T6/8kc37n9
 Uhr43dUhJ2RBQ874detbYbbuROXhiZNU0LdKJfLZUnHdjxOE1t1GBTb
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: LczxGJtppHUXjC0dIEo8YxZ1xDz3xbV5
X-Authority-Analysis: v=2.4 cv=AI0/m/Lt c=1 sm=1 tr=0 ts=69b2ec05 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=dlK5iWcZi1ZAZcL_4pgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LczxGJtppHUXjC0dIEo8YxZ1xDz3xbV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX2XED03rC4Zy7
 2UQi0DhnXgPYhw2SKG1fwpji5BQhecJS5tzf0Jq6Jo08jUjP7YDPdk8DhCgCQFr8nSaEdY8g4ug
 Cxcr6NW6M5CaU53eFrW78ZQuTlLwP4+Cc61EyFn5418+43V0ZXE3/9hbtMM/F+tzkbTCFfTsSOj
 IQggM0ylHid8x46WdWwAUFiakAN8mI/tSIqr02QNgsAUTVmAGr6WaVu7AGW85vOSzly480UbA44
 UNkmZTnfQvR4RnEdQ3/CjL1vRXpVQA7QLt1QI0jy2s0Tm0fDG2LuESqlK6rxu7w4d6qVPhGvGMR
 dd0EXMHqmVnV0dn27Tida44g1btLq9oZMefbfK6C9JfGK79GgyVtUkPuZmWseNaQFzF7buNBjJR
 ruIj/kRh/1qiBBIcGfLk7ragWVQBGPGLcsTnq63+geHfum69ZBjoUqZ/wWOsP9taT8JS0/zE/VD
 tadoYY+v2sQ8kcLtb3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093841_120160_90301F1E 
X-CRM114-Status: GOOD (  16.13  )
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

Prepares to fix improper Mx positive error propagation in later commits
by handling Mx error codes where the i3c_ccc_cmd command is allocated.
The CCC DISEC to broadcast address is invoked with
i3c_master_enec_disec_locked() and yields error I3C_ERROR_M2 if there
are no devices active on the bus. This is expected at the bus
initialization stage, where it is not known yet that there are no active
devices on the bus. Add bool suppress_m2 argument to
i3c_master_enec_disec_locked() and update the call site at
i3c_master_bus_init() with the exact corner case to not require
propagating positive Mx error codes. Other call site should not suppress
the error code, for example, if a driver requests to peripheral to
disable events and the transfer is not acknowledged, this is an error
and should not proceed.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d4f9e7df4adc5..bc1189afaed81 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1059,7 +1059,8 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
 
 static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
-					u8 addr, bool enable, u8 evts)
+					u8 addr, bool enable, u8 evts,
+					bool suppress_m2)
 {
 	struct i3c_ccc_events *events;
 	struct i3c_ccc_cmd_dest dest;
@@ -1079,6 +1080,9 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	if (suppress_m2 && ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 
@@ -1099,7 +1103,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
 int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
 			    u8 evts)
 {
-	return i3c_master_enec_disec_locked(master, addr, false, evts);
+	return i3c_master_enec_disec_locked(master, addr, false, evts, false);
 }
 EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
 
@@ -1120,7 +1124,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
 int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 			   u8 evts)
 {
-	return i3c_master_enec_disec_locked(master, addr, true, evts);
+	return i3c_master_enec_disec_locked(master, addr, true, evts, false);
 }
 EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
 
@@ -2108,11 +2112,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 			goto err_bus_cleanup;
 	}
 
-	/* Disable all slave events before starting DAA. */
-	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
-				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
-				      I3C_CCC_EVENT_HJ);
-	if (ret && ret != I3C_ERROR_M2)
+	/*
+	 * Disable all slave events before starting DAA. When no active device
+	 * is on the bus, returns Mx error code M2, this error is ignored.
+	 */
+	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
+					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
+					   I3C_CCC_EVENT_HJ, true);
+	if (ret)
 		goto err_bus_cleanup;
 
 	/*

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
