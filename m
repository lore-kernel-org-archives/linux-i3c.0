Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBD9F483C4
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5PPnt1UjZeiO0C0GVUCh9v3cm7oljfr8k47uIvbzqo=; b=GY001OASKbuQMu
	IZzvqnSzNKnKd2my7g/6aqQHC5maebZiyLvq8+NvGPnxO0Pn3xAVoOrqRnXqBd5ShtNiT2ekIZHmp
	Z17GUJ7pjBSO77/saNxb4HfZGy6n6cljliAzLzXFt5dVNti7SSvPc7OoRGySYB8H/HdIo2iK/EFYS
	4CumoCqWyIjtY6NYwtWsXbEgkLdGWlMrVKYdGCLNRE3n2uywQl9Zl/Zrb6d2eykim+XFS3+1kDLjG
	v3Uz1Py/lwQgNvZRPTwQKw3zl9CeFaNfNhcJAohF+Jbin9I+K5pfskF0hxN9K6CSrxQTs5xnIYrmX
	acREjzV0mnSp9sd7SNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsq-0000000H6Il-3KUL;
	Mon, 23 Mar 2026 16:12:04 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsn-0000000H6Gv-46cv
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:03 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDJE3n2959738;
	Mon, 23 Mar 2026 12:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=/Ryyt
	O51kIokrwY34bif8WzywVVWCFoTt6FqTMRSmTs=; b=pmFJn+PXrJj8gcQLj9Ikk
	bVfIaUADFjcxpSCi8DBlzqxEXyedtDFWOz7D8fmxJ5OPbCOjGQ498vP8jWy7xTXT
	eM2EN0CitYeOTtBeBKN+kxpq0Ao5+va4Lb93mkLGB4a5Pkrx0CUJtKi0tf5NP3e/
	LQR5Kces48UwSOjGL5G4lpHgg8IQpd6kJBDdz5OINgvX4Im2pva7xLzlpReI54sp
	utjUqDC9DRkvn8PI2V5hIzS0GXsn9HY4Gh77iV1yJjZZg9P2dw/Co0l1lJokdvr/
	+/uwQp2FZLBKPhUb6aYhEnJHuQxb+V/AIdGBTW896fz8JoPZ3H6gGxAck0PHA8Hp
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d1r81yqjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:53 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBpTJ044709
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:52 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:51 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 23 Mar 2026 12:11:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:51 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYnr019356;
	Mon, 23 Mar 2026 12:11:45 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 23 Mar 2026 17:11:29 +0100
Subject: [PATCH v3 1/5] i3c: master: Move rstdaa error suppression
MIME-Version: 1.0
Message-ID: <20260323-ad4062-positive-error-fix-v3-1-30bdc68004be@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=1781;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=3ZBequMiTUpfPBAKWSfnNwbUDplLtxinP1SufpszsgI=;
 b=SxzFEaVP+xIffwg6ugRlcWopF/ccTpcFpw7MRQNu4Wakf3y9/tQ9zqB7sbIDS6HjIjBYBNuQf
 AwwfejoMZSFCbfdi3Xo1KnlifDHnrt7osQ3weaXndYkYdoNLEwr2Pz+
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX0alqcZMkZjuj
 w52Mxh1leNZ9C1rpmzFUi5Ul6xs5DPsSCYmazTdZT6jZ515RslrMdrqKT3Gk1uBgNZthFVxbgBO
 kb6pyLju9sdNg8GTMQStzg6pIbvUjv4yGb1LCPC1xu5513sJ5zqS/R/3PylDuX9eGzxkFWohjc9
 inHfXLUrbz5HUOcH+ff2Oz1G83UIeTvuNG8gQTQz2nILqPqzfrWkmjeuanYqh+YVvvKGXcL+wTj
 TYlnYcTCNzS/NASahVljr4Oajva3UeWZ8e94mJeg/AxK/JAo2pXxgw3N7FD6jyEt3e0FJtF3OK7
 XBHs+2w8NdyQroHCRYlVCmX3ZMMAiKs9uLjZuKO6giM9e5J53L2qOn0ZSYcqLyu54Si73/a2JAu
 lcVekFno+VEaM6CDWfXu0fbTqEHBfrPs/6SEuVqf9z9SG0bOmJMG6sPUEbBAm8JqSOsQZj59iHg
 QJeCHFtR0wmkNdzvEPg==
X-Authority-Analysis: v=2.4 cv=edIwvrEH c=1 sm=1 tr=0 ts=69c16649 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=Ao6iV3P8B_HNZf798VcA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Hp0snLwimghyy3wZrYGO-ee82kZjU_Eu
X-Proofpoint-GUID: Hp0snLwimghyy3wZrYGO-ee82kZjU_Eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091202_025552_446FBA92 
X-CRM114-Status: GOOD (  14.46  )
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

Prepare to fix improper Mx positive error propagation in later
commits by handling Mx error codes where the i3c_ccc_cmd command
is allocated. Two of the four i3c_master_rstdaa_locked() are error
paths that already suppressed the return value, the remaining two
are changed to handle the I3C_ERROR_M2 Mx error code inside
i3c_master_rstdaa_locked(), checking cmd->err directly.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2c..7f4630ac8f0bc 100644
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
 
@@ -1794,11 +1798,8 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
 
 	i3c_bus_maintenance_lock(&master->bus);
 
-	if (rstdaa) {
+	if (rstdaa)
 		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-		if (rstret == I3C_ERROR_M2)
-			rstret = 0;
-	}
 
 	ret = master->ops->do_daa(master);
 
@@ -2093,7 +2094,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
