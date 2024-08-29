Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CE0C7EE32
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6QVEpONDYB6PbJJHgjuhrreCnUHVfrgN8a8HON0L8k=; b=y396ya2MAaZCWU
	QFCVu9NaYr84F5aAFO8N3gUPeHrvtJgkzH/7T+HPYXcSvqgVrXVvvvI9yO56iQQjSmIMVrAKo1Myt
	zhYuat5f3JrNOg9KGnowJ9NpMpThHR5T2/B0Dqjcq0j3/7yree2cvWHJJSbSpd5hiLTNoJFjFYZ6r
	hGTTn4JLsQ2lXLH9ixilUge4pJEzwuK1EnTGKjAupeh0j0AGAXiLdWMXxCoYsdGVU5OeXpUv79W25
	POd4O6+vHowVnxDDJOzzFiIiWyhKgFY72qAmDikPYN4r5oaIV4ZEsDQJreqw2BHvcISftqJN2sBft
	PRR6uNtYzBHQgbYTEtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZqw-000000010oZ-2rvE;
	Thu, 29 Aug 2024 07:45:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYoy-00000000oV0-0IZN
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 06:39:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM4ZV026587;
	Thu, 29 Aug 2024 06:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnzpndNdK/2kyzqJ55zW0fP85429rRJ5g+pWKtfgjks=; b=N64XJ8flOGV/xjHw
	0ZHY0FNAZkMu1Ius+kBWAbXTe3dpRQtqYt/XI1HnhbKHp6GwSfGEf1z7eU9AdSRh
	VaW3wjghhn09pehXTx6U4iGo7sowUZrlzrMX0iOc7AnDRgULl7yKj8Cis9iM+Ktk
	2TlwMdiUF+b3XKamzKMzbn7GnjP3e8o8A9Hz/DjFyI51Kl6RgvywgDuYvc57rlSL
	QHTpiPXEQU0NVUkz/pqHSvrCjBD0Gw3RJDrQmiyqMGLZib8M/AB7FCmY6IEPPYzC
	bZr5NOShky/NumXHBlC2p1VJfw7g7pnWhYZGcTiSJpq3J/2rbesKSneDR/TACWJa
	JodufA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuc4y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 06:39:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T6ddMf019248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 06:39:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 23:39:37 -0700
Message-ID: <f5faa10a-25e6-4793-99ad-dbcfe0ffee8b@quicinc.com>
Date: Thu, 29 Aug 2024 12:09:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] i3c: master: cdns: fix module autoloading
To: Liao Chen <liaochen4@huawei.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <pgaj@cadence.com>, <alexandre.belloni@bootlin.com>
References: <20240826123957.379212-1-liaochen4@huawei.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240826123957.379212-1-liaochen4@huawei.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y4I1wwiL6oLnG8FH6r6sVUgwqXcM2QvP
X-Proofpoint-ORIG-GUID: y4I1wwiL6oLnG8FH6r6sVUgwqXcM2QvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_233952_300615_08748269 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 8/26/2024 6:09 PM, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>   drivers/i3c/master/i3c-master-cdns.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index c1627f3552ce..ee555255f1a2 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1562,6 +1562,7 @@ static const struct of_device_id cdns_i3c_master_of_ids[] = {
>   	{ .compatible = "cdns,i3c-master", .data = &cdns_i3c_devdata },
>   	{ /* sentinel */ },
>   };
> +MODULE_DEVICE_TABLE(of, cdns_i3c_master_of_ids);
>   
why not to use i3c as type instead of "of" ? Just curious, if it makes 
sense.
>   static int cdns_i3c_master_probe(struct platform_device *pdev)
>   {

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
