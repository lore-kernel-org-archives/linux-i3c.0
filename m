Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCEC0218C
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jan 2025 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bcx8X7nGZmHArTFhdYMBQC+DZ/FpR99jHTi1P2ZwaY=; b=AYjK6B991AWvNDMonfm+mhwnTP
	TJEN88UnfK70KCI+UlPpysW36pksMeaGuvUrFd/QtY09cCrFVH7Ua9FDzOBPheITbR4+a/fQ6N7ho
	3ceVqOrcFMn/kyqliqq8XHAjEAAFhpJT+Ih9XEC2XusmstobaVaowTAw0qw+pvM8iN39lwHqPfMSP
	B+nyvB8BeOaC0LJsiQJ6e+8ztbFtt1WaHipvwv7dWgnVoID2ofcb4CF92G6mec/+LRr8jFxomOJmK
	nkfvfrYy6Oh2arJK8DkAtsSAZ6nofyIk5WOd84EAIm1R+5hlYW3qW9dZzetA+5DevVGUoIweGgDKq
	1kFtxVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUuL-00000009ZwI-33W5;
	Wed, 22 Jan 2025 07:12:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUuJ-00000009Zvk-4B7L
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jan 2025 07:12:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4vPaq017468;
	Wed, 22 Jan 2025 07:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCRQKg+dWEgG9CovrMHG+tqAY3oaLXY/3O5ELYTELDU=; b=gaqNNhAbV5i8JwVn
	vKtzltK4KDLii5Q3DGgR4q9aojZMVJzHMTs+GDTCyfHw7DEvTi5VYUoAu6Ba4RLo
	9clLB6LuESD8hvKRNdKbanT0Xq2BeKTp6pFKvY8ex3U8bq0CyqYKOXgldFH+b1/I
	fAbkhunuzPGzvyVikq0vPkyWYuROrea52DVa4V1jNybJuSXTqkFAKbJnPU9hLjkF
	vMKT5XrwfBmLdZUMRSr1jJY+dDqxB8VKk/OVvCcZ6zK11G3lhd7Wxs4NcBeJlmsH
	4YskMjdaVY8ZGmdVLXDcet93I4wm2if+d7A1HqQqjRUlbBeeCBtcGy2EswYo7C0i
	etzdgQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44at3g09hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:11:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M7Br0x026530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:11:53 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 23:11:49 -0800
Message-ID: <c4f2a984-5842-4b6a-a6a3-f26bf6903589@quicinc.com>
Date: Wed, 22 Jan 2025 12:41:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C
 transfers
To: Billy Tsai <billy_tsai@aspeedtech.com>, <alexandre.belloni@bootlin.com>,
        <pgaj@cadence.com>, <miquel.raynal@bootlin.com>,
        <conor.culhane@silvaco.com>, <aniketmaurya@google.com>,
        <Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
        <wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
        <Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
 <20250121110756.214714-2-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250121110756.214714-2-billy_tsai@aspeedtech.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Plds2WdWBV1siSkZCM0K6eMrLz1QDMAF
X-Proofpoint-GUID: Plds2WdWBV1siSkZCM0K6eMrLz1QDMAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=889 phishscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_231212_158851_37CF146A 
X-CRM114-Status: GOOD (  15.34  )
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



On 1/21/2025 4:37 PM, Billy Tsai wrote:
> The i2c_get_dma_safe_msg_buf function is used to ensure safe handling of
> I2C messages in HCI DMA mode.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a408feac3e9e..3567cd566339 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -382,7 +382,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   		return -ENOMEM;
>   
>   	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
Should be i2c_xfers[i].buf ? IIUC, it's iterating over many message 
buffers upto nxfers.
>   		xfer[i].data_len = i2c_xfers[i].len;
>   		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>   		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
