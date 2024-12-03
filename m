Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C9FE6C60B
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Dec 2024 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+TwffGaab1GSUeuiB2U5QahhcGXjucc9qiy4yhEyz4=; b=xlhHkchnA6ZwOShSkpJcYlSSeU
	jRUi+4z9ZAUsSBGdzn4369Rx3Pp8pTbww657TF565BabRsxS/1JL3Bzo2rSa9elktHAqor81vGpN1
	xGkZo/ppjFwu/8mjRTDtggJNgPHBBZOMi8S/wizjdPLePBYod13nNbcRCX1sl2AFqUNBWrLZInQks
	x7sghi9WZu1ulbNwQRHaSaysnJjgMv3gCaj19DgbO6tpTIqwB6tMYn5HbU9bRLLDNrenba50xU0bP
	MaBujJR/M6mWxOAcUWS8pl4uDvWVMGNc8LQm/uMiWJBnpr/BLtolaRg8DhRComRCdUwZlMGCCLo8F
	cGZXFPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMjf-00000008Rnv-1jGO;
	Tue, 03 Dec 2024 06:50:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMjc-00000008RnC-2Gwd
	for linux-i3c@lists.infradead.org;
	Tue, 03 Dec 2024 06:50:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B36MurN024050;
	Tue, 3 Dec 2024 06:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCJPGaWCPWcxLFhJ5O4pmeYSh0I0Y6wdmOQXgvY+B9U=; b=ZI3d1BydwMLjmRC1
	dilUyx9n7cnhd8fNkjUIIErRuULIHsnpsxtlVQZYnqrBKEyphbZhrFR2ZotZD1g+
	8Oh9KILAp6c1iOwMUmM3T1Af6Y1ULqaYI0zw8BsHrP3T3estPHmbm/F0dOp+Dbfc
	Dm8D1RJGMwb/+9jnUyLPK9ejxB+gRx00mW/2flwWx37FtiSasRxvLvSESHMx0rXn
	yl0/gPpKQE2BKUnG/oRBY/Is7uaWIaaHK7FmDw6L4dy2zjdvshMraCMo31VThDcH
	HWh72EeYSlwCfOs8gNNocsIP3Kg0ypyqqZlPUxG/8Hi/gGJBUJYbZgx0OYQ0uTmc
	6dcP0Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyr2a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 06:50:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B36o39w024694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 06:50:03 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 22:50:02 -0800
Message-ID: <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
Date: Tue, 3 Dec 2024 12:19:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
To: Pei Xiao <xiaopei01@kylinos.cn>, <linux-i3c@lists.infradead.org>,
        <frank.li@nxp.com>
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sBdvRWNeT3UK-VWc9RDHOJ0v9COKAQwE
X-Proofpoint-GUID: sBdvRWNeT3UK-VWc9RDHOJ0v9COKAQwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=910 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_225012_720346_C95B70C7 
X-CRM114-Status: GOOD (  18.86  )
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



On 11/28/2024 7:29 AM, Pei Xiao wrote:
> In dw_i3c_common_probe, &master->hj_work is bound with
> dw_i3c_hj_work. And dw_i3c_master_irq_handler can call
> dw_i3c_master_irq_handle_ibis function to start the work.
> 
> If we remove the module which will call dw_i3c_common_remove to
> make cleanup, it will free master->base through i3c_master_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> CPU0                                      CPU1
> 
>                                       | dw_i3c_hj_work
> dw_i3c_common_remove                 |
> i3c_master_unregister(&master->base) |
> device_unregister(&master->dev)      |
> device_release                       |
> //free master->base                  |
>                                       | i3c_master_do_daa(&master->base)
>                                       | //use master->base
> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in dw_i3c_common_remove.
> 
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 8d694672c110..dbcd3984f257 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1624,6 +1624,7 @@ EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
>   
>   void dw_i3c_common_remove(struct dw_i3c_master *master)
>   {
> +	cancel_work_sync(&master->hj_work);
You still need to capture return and ensure that the pending work is 
really completed or no more pending.
>   	i3c_master_unregister(&master->base);
>   
>   	pm_runtime_disable(master->dev);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
