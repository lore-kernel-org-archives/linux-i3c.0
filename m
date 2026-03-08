Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564FEA8537
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pv0fYSrPHfqiem3x4oS4sst9MAK6zuIyU9TsBX2amJg=; b=MwHXMQYzC/P2cI
	MROyc0pRB5SGMtMkZXRl+HQcZDcYFCbGaFRyfRodYT4k0hcAVEBEAiYlKkeyICGwAZbYG/5JGDkx4
	kObZ/tzTNW5DqBf/bEG5HODLWgZ+IeewX4TcWYlMMxTspvUG7PG4frnNXJlYBHD5eN+tq1jSAwj46
	cBtQzFU4GV1GlZYR4yf4+ZvdBxRBLGJz8dKyhPAukEwprURQr69qT1FCK/+dRFFAB3TT0hce4SNFd
	szPiiSYedHHk7/3QGw9AOcJorEuyO13ChIuvmLbEiytsfuktR6/Xm/c93hX2tgC3mZtqRYNiTR1NC
	nVf4c5S1OyUaTKCH4pCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIn-00000006BqH-1bw2;
	Sun, 08 Mar 2026 16:48:25 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIl-00000006BpP-1frD
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:24 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62888aLK1053727;
	Sun, 8 Mar 2026 12:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3KoQN
	979Q6kZk0irPLPa48rMvhLR23Dw11z6msngWIw=; b=gDXBDewouNIdiyPf7lfP8
	IVVOjVYGgVGDeLDkP4/9gNSa2E7g6B4yiT99iG8+Oq28TRViNT4B4LNBa9B/isFU
	72JxvLGHDatFDbHQHLu9ioAdkiaHHUpC3xbY/N3UAb1ooPxk6jrFy5YtT31J3YiT
	hpUDD5ScbOEKRB3EQ+oRLqyVejp2PfKuB+Pa9CI0Yb0JA9hof7DAX1fRlctZ9VxH
	VeMNYxSoeVNIW1h8TwSYKu0QUKgsuAMPasw/4XO+FHRb6xR2bV/doxGNB2NjVVEn
	REE6naWxqeXVHGixkWzBmKtsO1j7pY7rAtWnYVEWyWWlLOxlk2Rfn8dKud2RlsgE
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cs5bfrxce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:06 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm5Ia014363
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:05 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 8 Mar
 2026 12:48:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:04 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfH003692;
	Sun, 8 Mar 2026 12:47:57 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 8 Mar 2026 17:47:37 +0100
Subject: [PATCH 1/5] i3c: master: Move rstdaa error suppression
MIME-Version: 1.0
Message-ID: <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=2069;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=iZqbAB8vQJc6jYNYm63ig2FgFSYo/VrNnkWYc1yocMM=;
 b=a+u6kwMFHAGIx0Eakzy+DPtUWhX6JVIig4ZiXBI9AAT8CKR50i4Vr7dljXXuF4TjqEqlDLwRE
 uouc+BgEErwC7tXgIcZxiQbOiP+1FMij0Hhvpqg6iqHCjqF1T2bcVGl
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=IP4PywvG c=1 sm=1 tr=0 ts=69ada846 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=fgiNLFeR1Srqv8pP4VQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bLLq7ZkwYlDiZQx2v_9iZYNGpLaTIJPj
X-Proofpoint-GUID: bLLq7ZkwYlDiZQx2v_9iZYNGpLaTIJPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfX/zgi9MoJkvUT
 k82qpj0uffA+Q6NOLEq70iFZNVX6ZsJwjE+V5oqJM5qgwjrw2HQvJQInTVbZS2wvFv9j9BEPw5x
 ATLG+VA7Hr3ShizClDd93C26gVU13yGBMx+x50cMqEGQaP0IQ2PgUwKoH4YqTUuZRrHq+vi7bJ0
 iOLNUpNw4qBGzaUcWYZANP/46ie0hwFruYFXVtjcnWfqK3qhuQi7ZPMyyP31dRN0foaAdLZI0S4
 5wWt1izXjQTjyT1Z5fWk3DX3IYzRLP5z1qpRBXjwv7XgJiIZDm8u7/wb90XKhHi72/NcPNaRsFk
 3/vb8MucYC5on7tAsqWqPW/HnRkJSivoCbDztZnp0xwmduIKkqFAsEYNXocv0hq+HzeB07qvMNV
 GRf8YIoHyWDurXjG+javBJoY33027ZV9Tq9KnEHni8UCGCsVHK8o25WXycWHu/mxIPiup7gVRm6
 prn6cCiPzNpJB57QGTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094823_457437_6048BB5E 
X-CRM114-Status: GOOD (  13.26  )
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

The CCC RSTDAA is invoked with i3c_master_rstdaa_locked
even if there are no devices active on the bus, resulting
in error I3C_ERROR_M2. Handle inside i3c_master_rstdaa_locked,
checking cmd->err directly.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..31822fd5ffde 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	/* No active devices on the bus. */
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 
@@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
  */
 int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 {
-	int rstret = 0;
 	int ret;
 
 	ret = i3c_master_rpm_get(master);
@@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 	i3c_bus_maintenance_lock(&master->bus);
 
 	if (rstdaa) {
-		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-		if (rstret == I3C_ERROR_M2)
-			rstret = 0;
+		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		if (ret)
+			goto out;
 	}
 
 	ret = master->ops->do_daa(master);
@@ -1813,7 +1816,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 out:
 	i3c_master_rpm_put(master);
 
-	return rstret ?: ret;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
 
@@ -2093,7 +2096,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	 * (assigned by the bootloader for example).
 	 */
 	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		goto err_bus_cleanup;
 
 	if (master->ops->set_speed) {

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
