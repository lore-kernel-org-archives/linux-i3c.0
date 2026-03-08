Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C42EA8537
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERjz3cBIxC+ki9d45XwQI45dRbx4E5nwFgGr1zy9MIU=; b=v2kj4czPU8BQQ1
	21CnjpUKzsXfI0IfISlQ+D9VtrZIYGITGEp75xf29FopjC0siJvheUCsFF0wj27HcNoSNt7rUiOrm
	rsdeaJAU37cWfbNHIxrJ+49/iZ6plFrDHDxSjO7Cc0IejH41S4xN1EXB7lVPaFrLEvoqoU0WN0gLh
	rhTnxaeSyPQka/8ipP96mbDkVaJ4dSG5VX1bHOyGEKLN+eI7m1ouvcClXK8HlRjpVeWVSGjD+eMpv
	HchGiS6I5SZ25GzmM4pv2t0gwrLeXfUMo0OFJNwOaqnJ+NpfBQmTwgs59uYUfn1GNnAdziZeUYr6R
	xAJdSmpApdwTsOsyKl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIr-00000006Bse-2Xzv;
	Sun, 08 Mar 2026 16:48:29 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIo-00000006Bqt-3NoX
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:27 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62864D2U3743665;
	Sun, 8 Mar 2026 12:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=QDziH
	Fn53Wmkd+vFmXeZjFQ0tKI3GH5idSyPJjkevOM=; b=nlAo9aMcsINsohMwZjyq6
	om1IR1Ms/Mr/Xxl+8AZRi34MGouQhTjzUp97o/YJflDOgBVPsmNs5yYkirTguJVp
	Y+vnTIpjRBLEgratTDl8BMNWCVm/B5DenVkbKJWHkq9Z9xMSxGyRjJ1c/LE/4ayn
	go0X0toBiP/5ABOPm25BfP0qLkZFg+AY+g3LgMss9cDmBbvnv4fFLK+nQEzZ0kjs
	a14aBdWV08YiucMlQxxN7YurglOJlZNM77A7phTAEpq29dacX4mxtMgoqMQOntmW
	SqCxwM0VC+BG3LmEr1cDxZOb+Rhy5KV+Y6QyB7m4lKvF5kbMFNePlygN3M0urV+H
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4crer5urfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:09 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm8rt014375
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:08 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:08 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfJ003692;
	Sun, 8 Mar 2026 12:48:00 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 8 Mar 2026 17:47:39 +0100
Subject: [PATCH 3/5] i3c: master: Move bus_init error suppression
MIME-Version: 1.0
Message-ID: <20260308-ad4062-positive-error-fix-v1-3-72d3c5290b4a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=1589;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=OLd4gproiZWzSDd2UDgm7AnkTX/wotxorICxPJP1rn0=;
 b=Xl24JGZ3B+2kxYlTIyb4qG36xaPywdiw0blu0js0Ftq7KXybxN0B9BmOPzbNMvK01Gp8BnxC2
 hMNwZAvEU3aDJpgEoksdCApu2Bwshqiui/OEdOc7ecGCsAafCi+BI5e
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfX+uFmZfG0v2PJ
 373rOU5W4k7kJSFVvQQDkzPv9NIYfUy7vKkaR2yD8IsNFH12JGFMu8nyMpeYzWdLr5zJPrwV0IF
 JaXGosKyqG/ptxLv61sCSVevs03rkmuQnPGMfX64+5WX9hwdLwZYSzYPJJigDg221qnlQW7Ycc8
 MLNlHGhdjgJVZyUwyIQIe0GHjhd6IL64XdGSfaRjGgdb8+HRxcjpThGbBxfGo/yL2fPSI3M8N+e
 rXRhtNifAGBelwv2FdHaXntKIIWkY3eNBV3qWBjhvYaPPKNZlj7qsnieYuyyIyeSuf3L72MKZJJ
 eOYDmBfW5hCRl+E4nxAiw+n6xiA0bM3klPETnr4W8DFnNxr0dbezitMYEInpLscHuvph8P+KEVJ
 s1XiBQe1NQqwyjW8kHQn7rzObitorvLl1g4D4GXVG+Z3IHsF2yuyRhnN/fji30q3EOZPdDYadT8
 tI1DEaRr0W97zBQw5ow==
X-Proofpoint-ORIG-GUID: -Srvm5JMWMgKMrweAtzki0gm2Cr8BWz1
X-Proofpoint-GUID: -Srvm5JMWMgKMrweAtzki0gm2Cr8BWz1
X-Authority-Analysis: v=2.4 cv=YtkChoYX c=1 sm=1 tr=0 ts=69ada849 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=USoued4R0o-clvb-nzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094826_871872_11AE908B 
X-CRM114-Status: GOOD (  14.79  )
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

The CCC DISEC to broadcast address is invoked with
i3c_master_enec_disec_locked and yields error I3C_ERROR_M2 if there are
no devices active on the bus. This is expected at the bus initialization
stage, where it is not known yet that there are no active devices on the
bus.

Handle inside i3c_master_enec_disec_locked the exact corner case to not
require propagating positive Mx error codes.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ce1898345810..3e465587c9c7 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1078,6 +1078,15 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	/*
+	 * If the addr is I3C_BROADCAST_ADDR and enable is false, the return
+	 * error is cleared if the Mx error is I3C_ERROR_M2, to match the
+	 * initialization state where there is no active device on the bus.
+	 */
+	if (ret && addr == I3C_BROADCAST_ADDR && !enable &&
+	    cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 
@@ -2112,7 +2121,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
 				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
 				      I3C_CCC_EVENT_HJ);
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		goto err_bus_cleanup;
 
 	/*

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
