Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9A9F483C6
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ks9IAq5dhNfqAx8PnkLx4IDvt0BUDiYfWyFZ9o2sT+0=; b=D79fBfcaosKhNL
	fJ4NBdrOHqZyU5Nv8VUcl2B+BApt2D2XFCUfGeFhfoBB1Bx8W/DpoE2xZOBwKOHdRZ28Qrl0IPAL9
	AxUjuO3mtPx2KxBp8Rv7hVpaiqYTJlutL3hp1otXrNVAb/HN3+LabEJ64PPqH3OD8bv6HIohdEj5e
	ycgNJ0CEEuJkJUU11nwJiccquRYl6VhoPCkTE1Wnxc/O9tTuXcBnmunv45fCBGs4VVRDwnzH13kIO
	sd41kD8sX/d9toZUO9dlNxGBiYwbjLSZ/MfIYnl3jNCdNNYOChKXHIi4ejZOI5D0jVKiwa/+bynE5
	MbyjPavKQEoVaAPdz9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsr-0000000H6J0-0AR0;
	Mon, 23 Mar 2026 16:12:05 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hso-0000000H6Gw-04y7
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:03 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NETu6c2269582;
	Mon, 23 Mar 2026 12:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jqQ01
	oRDr35TiwU4wo4xjhtddDhKPHKqduRPfZ8Lx7s=; b=s5WodNUrzJb/8OvBvrNUL
	Ca/d474f5uOOI03ITXZZY+rYXNDWx40PCZIAk10c7aWDwcLgJckZ4Ezt3BtkLW6s
	XbmCId+BDYwOJUO8gIiy7x3xpYi2xsDsXRJPQmaiPaOOF3OOUUzDNH67b/rgwNXs
	O4KkoPAcUmpFTZHDSPCQpsfLpVaH9JpYikPrFaPhf8OM2F/ptJOqiQE/hpZ7cohA
	30dZelulx56+PEhcKV783So9KspAWpERaVmIplWbVSLKkSFR4t1CMaXJ2VG1O46i
	YZ8MKOXuz6iPACEs3FmEkFqNaOhEG57snpbjk8k74ei1bwq05ndSCcAn1TlEaI5h
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d2cnew41g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:53 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBqDF044712
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:52 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:51 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:51 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYnt019356;
	Mon, 23 Mar 2026 12:11:48 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 23 Mar 2026 17:11:31 +0100
Subject: [PATCH v3 3/5] i3c: master: Move bus_init error suppression
MIME-Version: 1.0
Message-ID: <20260323-ad4062-positive-error-fix-v3-3-30bdc68004be@analog.com>
References: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
In-Reply-To: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=3409;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=3Pb2fafyWjb4Ni826KHR4JgIYz8ThnNJh5Q6cXJbGqE=;
 b=f5V8y8/jg6vSxWtZXhI+qJqLtHol0PYp+sP9lKFx/UVVrRH1II66iijG8l+5plhXMkvIzgt2T
 AlJoR8VxdLYBGfiQ2Eo8whuFiTNfILCU/wN3bBzWklAWszB6dpuq3PW
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=UcVciaSN c=1 sm=1 tr=0 ts=69c16649 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=dlK5iWcZi1ZAZcL_4pgA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: c6rMEoqYcBcZxjeOtRHM4RHyHXU1PDPw
X-Proofpoint-GUID: c6rMEoqYcBcZxjeOtRHM4RHyHXU1PDPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX8ao5wzvbMO9A
 jtx5G7CBqgJS2802xpFcvpgm98cXmOh3ANsmJAigqsXAbTCK1s7D3cHnee01VV2QbFYrX8j97/R
 C/N60djFrLPW3DxZ8ZtR6HMaz0uf6mNsOEXJLryqj5HK11Zy18qVFPt5CAFYPb6Jpi24RNe1kE+
 HQrBv9Rk2L3PMysrZuBiM8vQhHj/227TNbfK3L/hJbm/sha3Wg8PoDybPGJ8dtt9fE3QbrHjggx
 i1m7ZO2stiLeCXOS++Nj4SeS+kJmXqm6kvA9NKbaXBCdsCLzdvZsaxvQf6YNRU5pLhbXmuwrY9J
 fr+JeGC5EaTraDhOTOisNbP8zNbBS6JobJmqm44leNXCZ8cPgv3PTqqUd643VkyPfRH/XGX0RN1
 JHgQVQQWZrrEpvWAYvPhJh+mNyTq5o+jwHc2TTj54FGniPO1+QdaL+RsdnHARIxer3p6Y/fTVWb
 D2d/Dj+UxaFRqoH/1ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091202_064966_F0C04C72 
X-CRM114-Status: GOOD (  15.85  )
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

Prepare to fix improper Mx positive error propagation in later commits
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1e2c086a24ac2..b80f7528948ab 100644
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
 
@@ -2107,11 +2111,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
