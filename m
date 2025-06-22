Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DC0C7115A
	for <linux-i3c@archiver.kernel.org>; Sun, 22 Jun 2025 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Igjg8owKdxQ7rKn1CnanzTwy9P10KP+yTGBGoO3dbdc=; b=2ZZlf6Hh1H+fF4
	FBBCPQJ0U7bYsEqIS0AgQZFDnVwaEAWcdqRRIfMQl8KO8eA0sMdu0BfllEJov2CFIqRdlY9rX9OFA
	BGg3Bj6M1h8Z6Lk/xJ5q7enVepvdiROs7VbaW+E4oRTThAzr0XarLpiNpYT+3SFOeI4Q57flOj/Y1
	6gHPm+ZJ4qJs+MlsR6CcKndZeZJG+Slmkeag1AXmjVSC0DS8pQBpEsRTCl3rBIgwPFqkUU/ZKBcjg
	HiGfo8hZOWb2mxMY2BYqxaUOWkW3KOgY6qqk7hOJcEwxkhx5VblXvC3crLDKRonL8grqL41go9PRD
	03FUi/h4fzzibD+zktzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHfz-00000000jnt-3QKm;
	Sun, 22 Jun 2025 10:11:51 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHfx-00000000jnO-1PSo
	for linux-i3c@lists.infradead.org;
	Sun, 22 Jun 2025 10:11:50 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M73GhH024701;
	Sun, 22 Jun 2025 06:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=HmyiwALc0RdYP7RT1cFme6Z39pm
	6ZOABZng/wTl/QrU=; b=NNWP7lmzUFqtKr1BGBLyBDWx9ikpYcHoteqeVxLa/EB
	kC/ld//1Qy1dkLdTd/CxnaUVCVgsvzB0OJHBckxJaf2ZXiinkZm8/5mulPqVs3pq
	6b1XyCX2sV3W6OTDS7R5wv/oDKHpTcYnPcVKvdtENl7qEClWZNFyDvAyvPtgw+yN
	iDQUnZ3t9TrHE8h//4/4fLhv2MGQyV1THbNqGoGCdv71qsHrc9WWSND/D9Vj0NKA
	NxzNsTmcgviP94LcJH/+OsC9DTR/GOLTfyANdiycEomc2wCQk5qeRKEXamekrtjl
	P7YAkR9olWX0SNLZFMA5AN9Wb1fC413IaKYyRNeQRIw==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47ed3qgdmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 06:11:46 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55MABjKp001647
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 06:11:45 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 06:11:45 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 06:11:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 06:11:45 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55MABXwc012869;
	Sun, 22 Jun 2025 06:11:37 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 22 Jun 2025 12:11:07 +0200
Subject: [PATCH] i3c: master: Initialize ret in i3c_i2c_notifier_call()
MIME-Version: 1.0
Message-ID: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
X-B4-Tracking: v=1; b=H4sIALrWV2gC/x3MQQrCMBAF0KuUWTvQTGmsXkW6CM2oHzTKJBVp6
 N0NLt/mVcpq0EznrpLpBxmv1OAOHS33kG7KiM0kvYy9F2EMCz9DLmpsWnhNSCgID2wa2XnxY5z
 CdHQnasXb9Irvv7/M+/4Dnue0S24AAAA=
X-Change-ID: 20250622-i3c-master-ret-uninitialized-16265d8a8719
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750587066; l=1178;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=jp4Pc36CSzzbXk6//MSHa6/dTKprXrPi4ybd/MOxNs8=;
 b=EWFuffKP2SgBONBC/1+34P/8TeIH1cTd9XrcGP6BRucKlus/qcH+2WqQHOhfGt2UKAdBiaX9S
 MI3t9BigKTRC4TV/YQCNmyiFgLYV1IN/X+eMMLAOrQkNnd3EvfasftP
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=HZYUTjE8 c=1 sm=1 tr=0 ts=6857d6e2 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=DsFxo23woeNpobuw7SsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BzeJCCSOoZQnRUJYl4w3ElJy4EZX4lhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA2MSBTYWx0ZWRfX56W7FFsZgIM8
 P8KptipaSDUwci68GFNtte7NS6mnGRGS1AP+gijqBYIh00HecAWhewZccaWuXvoTpnWt9xg8MYr
 KZYM5Pnrq/edYtsjdD40jM8OY3DuremXbfFNcMGicRKhp4nhKQ0eQHd2iqF/HrhvO+W1BF45nHv
 LI3AdqtuV+iMzO6mrEwt9wZsErwHpSkgQak2HUPHt34tiqVCcgZU30sYsygZ17bQdiF7eyt6x8k
 /4/Be/NdOpwkxghbbLU6XXu9PeEDee2RTAvfJwtjSXAsnFaqzNo1ftFXHoC11Keg5sHgA9BXviw
 VhwgepaXY+mZLtlYLXSNSrgy0GLHeMBBioZENCqD0cPceAiBCZLt67WoTOORSuPtxoyP0uxCv0e
 /tcVAiuuS2ZAb0oYILRw9yPryiYf1ULfc337shbsIo/13tgfjvpU+5LDiCNfq2+Gj7NV4G9Q
X-Proofpoint-ORIG-GUID: BzeJCCSOoZQnRUJYl4w3ElJy4EZX4lhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_031149_385707_CED5F8A1 
X-CRM114-Status: GOOD (  10.58  )
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

Set ret to -EINVAL if i3c_i2c_notifier_call() receives an invalid
action, resolving uninitialized warning.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
If a invalid action was passed to i3c_i2c_notifier_call(), uninitialized
would be returned. Add a default option in the switch case to set it as
-EINVAL; I didn't set at the variable definition for readability
purpose. The warning was caught by smatch.
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd81871609d95bc082bd401681e7e132ea74f8a7..68b8ea9174b984a6c89b389c4b3a9669239def70 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2467,6 +2467,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
 	case BUS_NOTIFY_DEL_DEVICE:
 		ret = i3c_master_i2c_detach(adap, client);
 		break;
+	default:
+		ret = -EINVAL;
 	}
 	i3c_bus_maintenance_unlock(&master->bus);
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250622-i3c-master-ret-uninitialized-16265d8a8719

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
