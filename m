Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C64D2CE17
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 02:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8T6FZlN8XgCvBas2mz21yYR6bFkMl0y+8ksJqevvoo=; b=Qs8zmzco1itT+O
	jQSJjfqPswdCe83cns67VzatN7m9V+M+wi3gcQBoH9NrukQxAz4x3BAF2Yk3Te/4qj2Pvmpvxej60
	elpJWAHSGaTnMzH4AF2Ipu0NswWxgDf4qsIuoCrjLaLNcoAtJ6yHnAwVWYeWLaeEClyuaaSQS4Z/l
	u8vITv2c4G/FXFBi24Rf4ukmeNWobm7APhMLy7UNBp+jfCBoA1VovIsdaeh0b8Sa8LOn6c78Xa/Wk
	0b87/Mz3Kgc0pPVS7VfgNzifuBG5f2cn5106Q8YORkhaNsiCfgDDU1DZ2lU8e1Aok37nkMuK5w+dt
	sJdH7Yp1yC0xi1QbMO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQfV-0000000CSKT-210S;
	Mon, 08 Dec 2025 02:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQfR-0000000CSJU-1TyU
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 02:08:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7NrfrK3171187
	for <linux-i3c@lists.infradead.org>; Mon, 8 Dec 2025 02:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BTfvhcRqxUR
	nsnKgiz1EOZ5o5f5DkaFQ7ZrEy13WVgM=; b=ImjS6GX6h7gbt3jPB9fIgIRs/7/
	6glve42136Ea3JgSFCJmTXvSWjUlx5PUjH7v65iES0yttAuQixV4oXMEeYvdOZWu
	1SrzHzIJQksaoneNViAE2g387oQvJDsucuPB7dy9+fqNZmMrHcs4ZJiKStn6+yfT
	lTmJaSXcuCGIhe/qSthQIay3pF6PuFiSvA/wwrqaHFHA6rIQpFmqesO3oNUtUbSw
	elfdMmJyUMs+rBhPT2E2cmXPsSbcVUVxkDCboKuYJgwK7IRbok2xd2Ki3xGUwaft
	wfZLQWqvP8/LDkB0RhwCWcSCEIfXiTgAdWsfk2hlLyvwrjLHThK/gCsSVHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbesbdpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 08 Dec 2025 02:08:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so7242909a91.2
        for <linux-i3c@lists.infradead.org>; Sun, 07 Dec 2025 18:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159680; x=1765764480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTfvhcRqxURnsnKgiz1EOZ5o5f5DkaFQ7ZrEy13WVgM=;
        b=Ac6zh6weAkkpopa0lQjEOHm/1SDue9to30bwUvi/kXtd7yG1Jd8b2RQU/1aFu0Lahw
         W1UuZ0JtloK5GZZI4Mg+msYidR9c3FDSYoPrEsl3a1Qt4QFXYUqrTcgQj4Hnto7iOyHM
         mZVuuxqcut6s06na3nZRwiG95uqJk4HjzaoXzwBGoUqoU0xrgic+X6Lh8ArTGoen1gCz
         R3BdF6CKCV6RUNan3NSRic6Uf3MFn1J58XEAcmpFqMh/mCGo4SJJ16X3H4ubJCLi8oL+
         8IXgJkTiKzF1iqzKU+bjnBkZW94fwfUUCWKCAa0pLNpl+WgGOR+YFHrE5nqfpISOzpL5
         PxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159680; x=1765764480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTfvhcRqxURnsnKgiz1EOZ5o5f5DkaFQ7ZrEy13WVgM=;
        b=EPYqtCgobFPwCDtm0ddYKUukr7AcKSbnvq2T0zRnOn+SjXZUf+1K+02i7SJnulfftU
         n0k1A0LEZlJWdf0yeFMSBGIbA6hZ6hicJO6aGBjmwSqNY00yzfhTLyoRzGZJet2tgSBA
         iZ5cyjbaVYvwTXA4iiVqCFeiiOChtjbfn2ItFcaVjyqWUAI/fvegd06xLbwNz2VbJo+F
         U4/jFgMTrCRWb2N40wmsOAfvLwPnKjg14bZFG6to3/bNolNdBGf54mUxQZ+rh+YuBzOe
         ROCGpLm4kdptlBpJjuD7Bk5aMr60jrKGd4pKQdKwAgaqQVImgcsvSgVj0p5ce7VEWuH0
         HKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOgA8cKaugkoMMB9E6pXnAsBZtZfvo65Re49RLv+A7QqHsdUGcgwzrThilykNwQ1Jr1K4FYB7nEPc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKcyp7dgUiRPWR8B59t7RnClyxr2njostahCrAgYP2tEtwMbCY
	kfp99Sf6JpwN201ysFBeD22dwaQBYJef8bySXEfLPs+BZvvbbieNtXegD5aJWgPrKp/jdg5IUGY
	+5gsJvZJs1MONw8U+4JX5LqzxD+p6s5VayilPy1j4VKU1naCy6J6mkpgaGrSz3HkVTJMe
X-Gm-Gg: ASbGncs9leXWVcJvRkaB3yJHaEo7SlMCs2oRDYC43TMuwzReZjKMkJdPafspSiTO/5O
	FQ7vUv5JTRnCQFJRyrZPPGUV8cxhHKO2hDRYVWU7CvQCa6IRkTWvocza8PfT7apGsgKimd2zu6O
	9KXIQtFjKYiZWaKd4zHs0DmgmT1iJS22YfuXBcyvYL6e5l5JiW2WzPXxP7hkh38Cnj0WmU8PHRW
	5cfI9fZpKuG9A1qmssf7DsUUC9ZgrDfTu/t2GozOQHZO7yMWTjkdNvF0yEaYIT1Kgngn6wjvbqj
	AobDuK6wqnJqn2h5b0HedhOaBQgHDWZ/DzJNep4P2PuhCNxQ4FuiI+0HUrTItlp4Y4VhvPtojnJ
	3O625YRVJc90lRfM9vk8VyakAt+be28JmOqMwKsgEqXEShcO9+Y0olbak
X-Received: by 2002:a17:90b:3ec7:b0:33b:cfae:3621 with SMTP id 98e67ed59e1d1-349a260ce74mr4308823a91.32.1765159679895;
        Sun, 07 Dec 2025 18:07:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeyzQPBXD+sGO1ZrYsRZrp+RaTLcp+OqUNV/xsobBfGObWODf+MLuiwU/GZWCi0NKv3T+qcQ==
X-Received: by 2002:a17:90b:3ec7:b0:33b:cfae:3621 with SMTP id 98e67ed59e1d1-349a260ce74mr4308800a91.32.1765159679401;
        Sun, 07 Dec 2025 18:07:59 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49caafsm109233795ad.11.2025.12.07.18.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:07:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] i3c: adi: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:07:52 +0100
Message-ID: <20251208020750.4727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nz5BzGCH6g/+Z7esXQ93fj4jElyjjjpotnb8G7ffwCE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjL3A/LWc58H0VvqOT97dIxKZ0KLJa2kC+4Sw
 Us8PDsiUjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYy9wAKCRDBN2bmhouD
 1yljEACC3WkXo00PMEysSNvrWi70Ri6RSKfDNdupKVnvRj9YnhamHzsR4etG7WdXkqf+JdnLUVj
 Y7x6abAC0+412kJGTz96N4Fakfog8HFP57zbVnoQ+FlMVEGj61NFt4epEUXfUv2F3Pu6URbIPrH
 N5Q1FkEYrGpfwN7m3ADDS4KFU72iDgzimu7olTvnvF8iLcMwJijqL3eg6p6usJkMHGRLp9sWinP
 2blGQpFrN3LUgklyzgD+uIufeKCb8psSp8eWNFOVTnUjuPTaVtZU7Ux1EWjqeRc0mhO3T7qxnuv
 C2FbY5/jNo1lefFXkurk3o7T66+QWFFHiV4N+HujNT79r47kKk+L8JVdtLA+jt9cY8DIvPQXDrs
 RHCofgGtbfqab5Ht3/vrnm3t8LUf8w0LBTKOTj6dk3WFr3GrPLBSu93S4KTctyqn2dvi8FkhX2F
 a4ut5jbbTwVMbwnVdx2yPlgmUXocBTcOSrobfAxiXzMJSH58Z/Y8dU7Vl8QEZBraIV9bxEr+8fc
 XU0yVmVJLNy7kJR+ZpzqaKxcajjmj7niov+pymajMZ1Dnytg/MangYzlgYJRq0NEmn49S6pnhY8
 weqfhVU9uFz4WT2uHfN/lvivD3uSLpXpSZ+r6Am03hiqkmgcIjcThnRgrAaqErxTrjH44iKCB5R suLkNqSmgP/O4ng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 705VZakn5vjxtDUEN5y7FOVYN9aYyDsW
X-Authority-Analysis: v=2.4 cv=GulPO01C c=1 sm=1 tr=0 ts=69363300 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_rgYJAmRwi-7zkpo_cUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX48qQDhiNZO4d
 PcPSmMjZ/MMQH93uhXc96IWa1KM474m8Mdyji0oDdkPDEslDV2wqyYvjcp/nzNEZr9lGjrUAqef
 GokwnB37Bm717cha57lmI2VGgcS8e6HYPTDr9aAoDfW9GVZExmsEEPtUXcqQeBiUK+gsTlATuA6
 0w+9BP00/WeGQcZ2+Kff7oX6Sxflv8w20jzI6m3PT0XHAwjJ4D8/UwgRf0VqQtg71wynY42g6ud
 WD9sW46HDNd99Bw8xOmg3C0q4yotnvHg0LksGxnGLc90wS/kSQsHk+SW+nDqEVoQmsnVndO4L77
 3Yn2mQsYrDNeHsPr1huwDvA5eBeBwKO4nn/PUZkRMrCdWyomKFJ64ZrkkqLMGuS/uRFPQu0V9WU
 9SWlABNkuGjcExvKOCPhz8C4sZlLQA==
X-Proofpoint-GUID: 705VZakn5vjxtDUEN5y7FOVYN9aYyDsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1011 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_180801_394120_700A6877 
X-CRM114-Status: GOOD (  15.39  )
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

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i3c/master/adi-i3c-master.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 82ac0b3d057a..8df62370b6bb 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -332,10 +332,9 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				       struct i3c_ccc_cmd *cmd)
 {
 	struct adi_i3c_master *master = to_adi_i3c_master(m);
-	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
 	struct adi_i3c_cmd *ccmd;
 
-	xfer = adi_i3c_master_alloc_xfer(master, 1);
+	struct adi_i3c_xfer *xfer __free(kfree) = adi_i3c_master_alloc_xfer(master, 1);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -371,13 +370,12 @@ static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct adi_i3c_master *master = to_adi_i3c_master(m);
-	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
 	int i, ret;
 
 	if (!nxfers)
 		return 0;
 
-	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
+	struct adi_i3c_xfer *xfer __free(kfree) = adi_i3c_master_alloc_xfer(master, nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -777,7 +775,6 @@ static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct adi_i3c_master *master = to_adi_i3c_master(m);
-	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
 	int i;
 
 	if (!nxfers)
@@ -786,7 +783,8 @@ static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		if (xfers[i].flags & I2C_M_TEN)
 			return -EOPNOTSUPP;
 	}
-	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
+
+	struct adi_i3c_xfer *xfer __free(kfree) = adi_i3c_master_alloc_xfer(master, nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
