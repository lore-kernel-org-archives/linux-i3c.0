Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF29E77197
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jan 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6GwtVxhpN5/11fnZHEc71LVFdyk2gJfBrcJKicbK60=; b=sxbtf5EHqcDghW
	PZFktwc+UwHDlowAaQxvOkiOq989gsOJBeVo3vt+WILcpw86Fe1uCj5soKPlndwA7F3WMF0XAfZae
	gPJodd+ho2MRsiOAjfYQ1rTotkPb2sqqVZjSEC9WQjfBJal/ZkF4EZrCEkGcMZByoQaBorTVta0k2
	IOrtgeKokrzkYvBKqA4TtMDT5ZV3ArLNPnnZay5L3SRRKcB4h7EsfFymt2/hrmMTmXcu7u3aERB0X
	zVKnEG8WaRL+RMQQur8K2bZ3Z7ezxRzj5qxmub0hQtOHehTo8/pA2jA1Yi/LK3mcBCSUa4uqwvj1c
	rjGcSy8bbhZN650uyEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoFG-0000000BDnz-2ho7;
	Thu, 09 Jan 2025 08:50:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoFC-0000000BDmb-3YdL
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jan 2025 08:50:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509418Ak030410;
	Thu, 9 Jan 2025 08:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	he/XnQHzrk94R5LspwWCWwvtkBuM8+4yqBzwWYA4MwM=; b=RJf6at5/GdAFzjur
	Pga4SWm/90TWSI8aLRrCLImtEmNVK0jv1omfYiYR8RmOUyP+DQqhMQCgznO4Nh5/
	IGfKe/cKXo/pLxGAumxrkIRHR7LrFx/4fgW4pXcImconcEiAPGweGFQ0/wGkNx1L
	/Vv9595F37VvtPUAkV9dFz+H5ntRXLMJkoojn8oFEHOq42JJ8C1yd0NelyVdfqGP
	VZ9K30OqC1nuJSkPo5hR5RAUuGB3RDBZ5NV0NZCQPUoZWaLpQFzjpqEAiH+zU4HW
	UMjsiIO7yZ9M+vEZC0uKWcoLxmtGBA/6imYwIGLksPYQLhst5BQJLKQoNvnpWxJN
	R6fWzg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442727rm3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:50:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098oJbP004724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:50:19 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 00:50:16 -0800
Message-ID: <9d0dac6c-b9b2-4852-bd42-8aa14124b24c@quicinc.com>
Date: Thu, 9 Jan 2025 14:20:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
To: Frank Li <Frank.Li@nxp.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Carlos Song <carlos.song@nxp.com>,
        Miquel
 Raynal <miquel.raynal@bootlin.com>,
        "moderated list:I3C SUBSYSTEM"
	<linux-i3c@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
CC: <imx@lists.linux.dev>
References: <20250108225533.915334-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zLUHJtMqEoSGYBRjPKlAYeWuCXlRxnFk
X-Proofpoint-ORIG-GUID: zLUHJtMqEoSGYBRjPKlAYeWuCXlRxnFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005023_282626_7E67E4DE 
X-CRM114-Status: GOOD (  17.91  )
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

Hi Frank, change looks good to me.

On 1/9/2025 4:25 AM, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
> 
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
> 
> Cc: stable@vger.kernel.org
> Fixes: aef79e189ba2 ("i3c: master: support to adjust first broadcast address speed")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i3c/master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2d..53ab814b676ff 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1919,7 +1919,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   		goto err_bus_cleanup;
>   
>   	if (master->ops->set_speed) {
> -		master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
> +		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
>   		if (ret)
>   			goto err_bus_cleanup;
>   	}
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
