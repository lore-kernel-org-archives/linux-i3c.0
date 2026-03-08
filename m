Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCEEA853A
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RofOzF1WgkgEpXgQvCiJQmjtGjvSEn1IGhWc03lgACA=; b=Hreh7Tj+SFXcZ0
	sS/qJSCQlAtXnPQhZRzh4qbGJR3/VOjrjr0Cjl7xhJ2LsGOaYAd+lPBOWuaUmdGtx6lj4IgyplPqF
	ShRuWq+CLCoOMmrLjAnyeVzWyND8HFGCxu9jqa335JxpPYFGkxwsXPSrpFHNzHJllwkPG4Jgt7X2E
	MH9fB1DdyD1lgRQaIhBLMdMMwFYREJ3+1/E3QJ1hkFxbUOQ2O3cAfTLiq9D7uizWyvcNuD444Gn2o
	aENrr2YBlOT+/VTaqibRHMHZgJR8o3/iH4x1NoxAYp6gWYRKz7DIbioR8GVUkyTNWKJwHVfMOrkM1
	99JnKWF7Cqz2+IC3Xw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIr-00000006Bsq-3YuK;
	Sun, 08 Mar 2026 16:48:29 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIp-00000006BrP-3ENT
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:28 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62888kDj1054216;
	Sun, 8 Mar 2026 12:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ui9np
	Tlq4v4aIzXXBurcjkefih3umh2C7ZZx9DHvDeg=; b=hAkHObp0wbEzG1CFnZ6p/
	je2QFVyNS5XIL9afqBYVoWnlCGTpm1/6wSr8mWsm6YMFAemk+EUPHd4cD2Zo94XP
	NhQd1wq56ZCnTZNiSWU0WZ2bTK4EkUJWMXj9r7+mLG84/XknTDEfZVUPIIdZ1SdP
	yEaL45E23pkjoBLFu/ta7qP61yf+Hh/E+/3FkxcxcwyceQcyjxlv0AogWcVRn8CB
	LFSqr5f7rjtUwH2VZET8nH7TuH7a9BywzxtTCBLQ/rs8wMDlPkLSLW/aPX97IjK5
	6kMYtGv09P7HAnxs9pktbupQeBn1tDWRPi8zzrelQtUZvuFQLf+SoZgZ+gttBjJT
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cs5bfrxch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:09 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm8lQ014378
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:08 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:08 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfL003692;
	Sun, 8 Mar 2026 12:48:03 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 8 Mar 2026 17:47:41 +0100
Subject: [PATCH 5/5] i3c: master: adi: Return xfer->ret at send CCC
MIME-Version: 1.0
Message-ID: <20260308-ad4062-positive-error-fix-v1-5-72d3c5290b4a@analog.com>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=853;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=JWBdR+1TIsvuhcqzYYchwYWj608bF8a4ahM3xFDDQ3M=;
 b=B80T4uSWak4aSl3HyDlmGpUnjOVdNfGoRjnSUaTJQ+d0kcX0ra2UvQp8nLbMpCMsleln2W3Rp
 b7j2MNSI0n8BUf0u5b8Jzsi7NrYtYu4HTUUoY9E2EJaLdwqo2IQVTri
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=IP4PywvG c=1 sm=1 tr=0 ts=69ada84a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=7Wge7DrbkOJa_FxU4nsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BggJjlY5LP8wjvLYhud-rjgNK6lEt7qv
X-Proofpoint-GUID: BggJjlY5LP8wjvLYhud-rjgNK6lEt7qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfX0wIbCoKn+GOP
 PVf0hOnbeSP2q9Y9fMHugW1FZ7b479SIZ56ynxJQwGLCaEaFp7/5vC3w2JVG9hqi+OAZKMmu9HJ
 xoXXDdIH0bwh22lN0q/jNnDaQgaEBauQ4dWypYQv1TJHQiHGYQKeBMGpMHxtPZkipAeBBqqyKqE
 kSBy8aIYRhM6oxItLqZB1yhRxSoS4cLoxZNMqT/uly0/WZiakEjK04WmEMZ89+sYnEzkL1NCpSa
 fSNlXsCqazbpEQQWOXaUh60lJiKPiyeWSc+c+GB4VlD11azTji/92JemaWtqJDnq12oIHI1/qLx
 A3CxzHVyIAVD9Ih9FpHcYZJfXg/cSHSMyyk67qe/QNn6VBPRyvdTHPWuWdeP19uZTtu+io9iBEW
 vlyojkCTPLU3ERvhMAZtVP6WiUqfTErrRZCR2Iua9Ia79a6mygLSMjXUscTIm5IBIy+ArkCqCZJ
 Q4B3jXPdZ9u1uziiwhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094827_838579_587F009C 
X-CRM114-Status: GOOD (  11.16  )
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

Return the xfer-> ret error code at adi_i3c_master_send_ccc_cmd to
propagate the adi_i3c_master_end_xfer_locked value. In particular, if
any of the Mx values are present in the sent commands, returns -EIO.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/adi-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index fb9a48830446..047081c9f064 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -361,7 +361,7 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 
 	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
 
-	return 0;
+	return xfer->ret;
 }
 
 static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
