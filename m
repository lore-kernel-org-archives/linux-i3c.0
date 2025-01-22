Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7C9C02182
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jan 2025 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGW2jJoS9ft3T5B9V6E6WXjuiupV6gr6EciEufi4f/0=; b=qSSR6iF37GM6SYrnkF2zhlJOmz
	+y6vexiP8/panF/tJMQe3slAj8kkX33PVMDt3ayffFRo2aLoIFUm+Ic3WzpLa2mb6D2PlA4ZLjErU
	NwrpLt2VFg3gRQ/D+rg8wFhfqOCTYwmE5OgA0DNnT1htuj/KY5A/P1iPlCg3lPOOKZbbCkim9ZqL/
	Fths18BWgWwlf25XQ0OK3163zZ6Rpa8dmdiVTXxMt9L3Dz3FrTkbKIxxXOIOQF5H4XggWjM8/opRV
	Fi8roiYRys0YqkFBn8+Y8QvJD6p1RNLAKfKCVHM8NKPC8h2djki2kAOegi4Xvnpz4bN72AGbhKNwH
	q54+DiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUuJ-00000009Zvj-1qNi;
	Wed, 22 Jan 2025 07:12:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUuG-00000009ZvL-3HUz
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jan 2025 07:12:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6VeTn018272;
	Wed, 22 Jan 2025 07:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4ONRMFJ33W2W+pkz3dAYCRX2vppNe3R55B/m0nmeSM=; b=FAVe3zOeEr0qo2Xm
	13AORh9N8D2UUi2fbLZIEwKefOf5lJrrzqjHvqlD0QaOqUx6+0l9jBA6REIYtqtv
	udo11dqib8tOAKnEy+VSK0ksJcy3NTlgwG5zySE6u52JbJR8PqB6RmRT9lCLmUJT
	YcspFnDd3h9biJNLx4bdaDR7GKmMt8MjCV0l0JAA5ps2uaEYv2LS5s3V72G4IgNh
	L28xAX2rwe37WxyT12lLe1a9tQtZ5B0n46LDkhV/vltydWNUikJDaY+r/TK4VA16
	EaqlnsPjbQZgnhXQCpgstADr/RS2SPui6a4EpSyuE6reYsxKfiPyEAEXbPSo9HRk
	1XQJMA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44aug2832c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:11:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M7BZBx024719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:11:35 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 23:11:31 -0800
Message-ID: <b91a21ed-c57f-4b71-8232-a3cd7124a549@quicinc.com>
Date: Wed, 22 Jan 2025 12:41:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
To: Billy Tsai <billy_tsai@aspeedtech.com>, <alexandre.belloni@bootlin.com>,
        <pgaj@cadence.com>, <miquel.raynal@bootlin.com>,
        <conor.culhane@silvaco.com>, <aniketmaurya@google.com>,
        <Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
        <wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
        <Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RLOMW_yZWZpYIW6jFVickxXXvy7yVYTz
X-Proofpoint-ORIG-GUID: RLOMW_yZWZpYIW6jFVickxXXvy7yVYTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_231208_949423_B8709220 
X-CRM114-Status: GOOD (  18.14  )
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

Good Change Billy. Thanks for bringing this to i3c.

On 1/21/2025 4:37 PM, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c     | 2 +-
>   drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>   drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>   drivers/i3c/master/svc-i3c-master.c    | 2 +-
>   include/linux/i3c/master.h             | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d09ea5b6467c..54c7d86997d5 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1079,7 +1079,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>   }
>   
>   static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				   const struct i2c_msg *i2c_xfers,
> +				   struct i2c_msg *i2c_xfers,
what we need is only i2c_xfers->buf to be DMA-safe, not the *i2c_xfers. 
Right ?

>   				   int i2c_nxfers)
>   {
>   	struct dw_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 8d69a34986d9..c9e4c129454c 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -813,7 +813,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				     const struct i2c_msg *xfers, int nxfers)
> +				     struct i2c_msg *xfers, int nxfers)

>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>   	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
we only need to use i2c_get_dma_safe_msg_buf() for the xfers[i].buf 
being used inside the driver as a protection ?
Also I guess same change is required for all the vendor drivers. But Not 
sure if it's feasible with this patch ?
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e6e482a259b4..a408feac3e9e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -367,7 +367,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
> -			     const struct i2c_msg *i2c_xfers, int nxfers)
> +			     struct i2c_msg *i2c_xfers, int nxfers)
>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>   	struct i3c_hci *hci = to_i3c_hci(m);
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index c1ee3828e7ee..24bd701b5de0 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1584,7 +1584,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				    const struct i2c_msg *xfers,
> +				    struct i2c_msg *xfers,
>   				    int nxfers)
>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 12d532b012c5..c67922ece617 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -475,7 +475,7 @@ struct i3c_master_controller_ops {
>   	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>   	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>   	int (*i2c_xfers)(struct i2c_dev_desc *dev,
> -			 const struct i2c_msg *xfers, int nxfers);
> +			 struct i2c_msg *xfers, int nxfers);
>   	int (*request_ibi)(struct i3c_dev_desc *dev,
>   			   const struct i3c_ibi_setup *req);
>   	void (*free_ibi)(struct i3c_dev_desc *dev);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
