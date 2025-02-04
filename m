Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B148C02196
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FkqVoTq+CfFJOX+GNeVb/c6AIen8UYaHoz6QXXzO4U=; b=Wo67IPeyfvty7A2xhcRKgU+UcX
	EgL4DOGj4BhErNuWwdkKI2DT0TiIAry7VJ5dy6/6pI/ncmPUwigb6dlWefAk9r4JZpLXNwu/ZZiGe
	/COPCTrkZAE89cC//tLj4Qi8RRqtOfV4rZnlC3FB3wF38jcUvCo1LFEI08OH66wB5kvrVT2EpTgrx
	xSPzbp/gcNNTPwS+sGfmaGE8sP6z8QgViuHQ0s1WqsFi5BdO9tKL++Pnd+pmwbHyVnZfQF1wAHeIH
	i09ZDkoG1qW+XlJeGO1MIKsvfXRgDDZ8yE5aT53OTSsOLLdXk+0WsFD+S2A9h9efrx1EER1AY5nzW
	F8FtnjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKfb-00000000nA7-04Ni;
	Tue, 04 Feb 2025 15:16:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKfY-00000000n9N-03ha
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 15:16:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BYSNb010392;
	Tue, 4 Feb 2025 15:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5r8czkbzYXVx26WYhM2Xu+E+zNDeBL7QBFVsOOc/Ex4=; b=EhS1BkWyoLO4trrb
	FeiQ9/svnWtDp1/cQateO6DSLxoXjq8RPmzNVGiBTMbJgrBoOvIou3LkKJfG43yL
	wPhwTHXa3nsKFY/vu2y9f4cd0hsSXQ4bN/tDIdnbbISTlcotyUxuFCanwA9EDmMi
	Lusm7LzHjBdMerk1Xz4S6fnESfmnYRDgegTdudYORkIX3RDzPS3L7IhpNujjkaY0
	hTctsUk45ifAtfaTlAxWDTPJciWaz0lf1Llwl8/82/b2KICBorR/AY/Y44pkrY6/
	QCaTo1+lIDnnxb5ny2dhJY5fb5K9vij/D8xpS6J+EKufrSqMXgx8chC2b5ZvJGi1
	y843Ag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kj4yggxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:16:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514FGZrH010144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 15:16:35 GMT
Received: from [10.216.45.46] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 07:16:30 -0800
Message-ID: <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
Date: Tue, 4 Feb 2025 20:46:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
To: Billy Tsai <billy_tsai@aspeedtech.com>, <alexandre.belloni@bootlin.com>,
        <pgaj@cadence.com>, <miquel.raynal@bootlin.com>,
        <conor.culhane@silvaco.com>, <aniketmaurya@google.com>,
        <Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
        <wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
        <Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z3AUbk5MKVla8EDbImzn-_JZx5NOdDAg
X-Proofpoint-GUID: z3AUbk5MKVla8EDbImzn-_JZx5NOdDAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_071656_060923_81CC251E 
X-CRM114-Status: GOOD (  15.32  )
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

Looks good to me !

On 2/4/2025 2:47 PM, Billy Tsai wrote:
> Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
> the I3C-specific API.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a408feac3e9e..4f3738beb0f2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -382,14 +382,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   		return -ENOMEM;
>   
>   	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
>   		xfer[i].data_len = i2c_xfers[i].len;
>   		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>   		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
>   		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> -		if (ret)
> -			goto out;
>   	}
>   	last = i - 1;
>   	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> @@ -412,7 +409,8 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   
>   out:
>   	for (i = 0; i < nxfers; i++)
> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> +		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
> +					 ret ? false : true);
>   
>   	hci_free_xfer(xfer, nxfers);
>   	return ret;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
