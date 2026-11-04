Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E55606A326
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UG8HNR2i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZhDwHyDb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ir095qzvlTIhVMAGMXIH9+ZQjpgvp4K9l6SWPJA2PTA=; b=UG8HNR2i5C+xoMo9zWCKr2Ileo
	GeiaPEMPCcwqFBByKdVaZ8KQQkRuEzUVM7ne9AjKjiCYO626sV8r6owZV/38fAckOWyMWaUZLU5lY
	/DazWO+qwX/hZUChoGB5WO7g8xPeADzw3VbdWMs+H12bIDAgR/0u+/u1sVhWP6CcsrMXLKE4W2GWd
	X0BUMxlOYQOUscrJNvoEcuGBN7KJM39nb5jcgk+rxng0zWbg+aCPw9HE93mnfhwkqpmWYh9cUOTAA
	Mlg9AhcsYzjMNwev/Yl7ETkQSviMlFmINcZBtlD4pd/mdxb4RbFvjYMdcdBU4vXKiIRJNt3GNqpri
	QJQdBgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYyp-000000057sh-3CpI;
	Wed, 04 Nov 2026 11:16:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYym-000000057rz-3NXk
	for linux-i3c@lists.infradead.org;
	Wed, 04 Nov 2026 11:16:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B5VaO2600273;
	Wed, 4 Nov 2026 11:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EKNkHe58jko
	DMKUXvbrXleOxHAGull+uYnWOftiZvcw=; b=ZhDwHyDb59ye51cMKfhgCqe6+wA
	vn81Zch/4w86yG8DlxY6+ecGLHujRJiEi4jD7ez1yVHJLZp/7nHM4RVlPZw11gtn
	pIk+0pCv2pKS3Xgu54JuzVBdv0GRv/iumKaGSslMah6O6OazfZBejCdqFPLyhM+v
	gM3YJ4FbF5nGWO6wsWlWaSfnCOcrTYAEJAzhyhjIigyAkpZ/TZQ6BAkzZTeJq0Cf
	+EEoN9i8G04Cd6WThbswxsaI3nzh9gGzCTIu7qIcmbiA2ppM/C9hjkEFY+iSbHFH
	bF2KDQE3XiJ6IoVQXOudUGdP2+eUNgMXvYavB+UosAA/H47a2vSCX/neatw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkt3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:16:22 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BGKeb2675674;
	Wed, 4 Nov 2026 11:16:20 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4BGJkQ2675660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:16:19 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id AF973216CA; Wed,  4 Nov 2026 16:46:18 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Wed,  4 Nov 2026 16:46:10 +0530
Message-ID: <20261104111610.3739095-3-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX4b3yMqPucaBU
 zZYp6XCB9uI4FA9Sy1o8QEuveGBv69jibgks4Ji0U8RpEmL4RkCl9DtLh9TTMo31AjsGHf6CL7V
 bg08X8KfrgVMgY13FlbfCl8trhCLy1o4gpbE3DeGshqDqSg6YBv/c3L1qpQsyK6YNDM8h6e6EfV
 GtdAiLctMBDXoN09Iv2Lxja2roz6K1+hnuowhMHk+mgW713OUa+4OZAUcniwXU75yTIy9ue8rrE
 +XNOwm0j2YIbzTWMAqFTK1lk4vMteKpuMCEyEXOrfcuPHVG5XwbkNsRQhBvAJH8i5A1GYjOHKSJ
 9CxCOei9E5V7+lE5H6OlRzUgPq1TnUX2E3G4CzeCkFE5VbpxOOkqyQgqLdFf2dXHxl4XTpznuJW
 os+61r2mBiGP27gOpLfGsBXlBoYNr6MraeFngqNppNij5UFPFpNPcYVm15YfnyB1RTDU8drQBl0
 nVlwXeqdrmZtL8YrgFA==
X-Proofpoint-GUID: DILj6uuxh-N5uuwGQY9ZQyPrOlCmBUCg
X-Proofpoint-ORIG-GUID: DILj6uuxh-N5uuwGQY9ZQyPrOlCmBUCg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXzrmUCp2GJfqP
 KlkLESRRfxgsRhFt7OnIsprOyX/R7WvdXdSNnFeKUjxAbodkEUSWgbX2WnHC5sJctRhQpMnZBJw
 QpcIRTwk+oA14mhITR6TrdLhiFrS+HY=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb1406 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=yC-0_ovQAAAA:8 a=tiOelxa7q5ZmzYUgxBwA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_031632_848437_741BA665 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -2.7 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..43c5730dd007 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12637,6 +12637,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 F:	drivers/i3c/master/i3c-master-cdns.c
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
+F:	drivers/i3c/master/i3c-qcom-geni.c
+
 I3C DRIVER FOR RENESAS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
