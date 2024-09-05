Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF643CD5BA2
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2024 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZ51xXDbsfnvQ5YpIf0UMhhWbjmsglfWUGyMCcYzdHo=; b=NxZ3zFsB+RTWCy
	sAijX/5IcFeE1oM/mPEwFi8iW+jz4Bljn+DMbNZVVcM2hdoOxAOlUt+87v+T0aMzyo+T0JOunUhSF
	4d0Xmu6//BgspFKKGcwrZCFKrvax7RXvGWeDs6OYvH8ukB08Oj05t8oEjYzmiCFw7Hp81OL6lAqnw
	xXbYF0vAzL0EqeC9R0ZOgUMVeZ7Xodc73CQR0/5ONozhp6i+QyqqcnxLs76tCpyvOBZjo1nNo0ag/
	miV5OjAU0oM0tLqwbe0ZgCMDywpIojfuL5A7GJ9tYfD1vmge57fQ28QX3qlu8aIwx88rqWsexlQa/
	L/M9tOaybstkcBQuS5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9DG-00000007rc6-0scB;
	Thu, 05 Sep 2024 09:55:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9DD-00000007rbN-0GE5
	for linux-i3c@lists.infradead.org;
	Thu, 05 Sep 2024 09:55:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485972us021530;
	Thu, 5 Sep 2024 09:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBMqXnOczsEWfeTQoQ51IDQfRhAhgM15JSl0gQxMj6A=; b=Nwwwea0W9WbcRxVF
	2PmCAg0NDpYKxGvQygueg5nVyCwyc4MNbkgfjj9shpK30dun19947UnfHiDuC6S4
	PHWiy3brVswKKHLeEDMfv+DeMbCNN+TrB3mN0nqY47wpZJXgJjlU6Y+NfGTyLF6i
	o9MXLMAchYv2Atf+LnKLQzQfu8/oV57DUhdTMiaAL6jkqCqAGPWE8K48RTv0/Ehp
	DP1dhmVuxEw+0FN1C9byjJbloNK4haOPGd9nNiNolT+FmQ+hMZERDo7IYcZzheNK
	hWDA+kE6zBOYy0MzhsmpjoedmYMHr5yFzZelBTtPIptXbRUvf3Ewtw4prk5oSpRl
	SYOUTQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f6rngm2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 09:55:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4859tENU025863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 09:55:14 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 02:55:11 -0700
Message-ID: <3da836dc-d79c-41b9-aa44-06a94b812bbf@quicinc.com>
Date: Thu, 5 Sep 2024 15:25:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i3c: master: Avoid sending DISEC command with old
 device address.
To: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        "moderated list:I3C SUBSYSTEM"
	<linux-i3c@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
CC: <imx@lists.linux.dev>, <Frank.Li@nxp.com>
References: <20240820151917.3904956-1-ravindra.yashvant.shinde@nxp.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240820151917.3904956-1-ravindra.yashvant.shinde@nxp.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: --tq_WtyveLVUmGPAkj8J0FB7csNXAuG
X-Proofpoint-ORIG-GUID: --tq_WtyveLVUmGPAkj8J0FB7csNXAuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_05,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1011 phishscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_025535_146593_6AA997F1 
X-CRM114-Status: GOOD (  25.54  )
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

Hi Ravindra,


On 8/20/2024 8:49 PM, Ravindra Yashvant Shinde wrote:
> When a new device hotjoins, a new dynamic address is assigned.
> i3c_master_add_i3c_dev_locked() identifies that the device was previously
> attached to the bus and locates the olddev.
> 
After  2-3 reads i could understand what exactly you are trying.
Could you please keep the complete commit log here ?

"
The olddev should not receive any commands on the i3c bus as it
does not exist and has been assigned a new address. This will
result in NACK or timeout. So, update the olddev->ibi->enabled
flag to false to avoid DISEC with OldAddr.
"

Make a complete story here, you don't need function to be added here 
since description should make it clear to understand.

> i3c_master_add_i3c_dev_locked()
> {
>      ...
>      olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>      ...
>      if (olddev) {
>          enable_ibi = true;
>          ...
>      }
>      i3c_dev_free_ibi_locked(olddev);
>      ^^^^^^^^
>      This function internally calls i3c_dev_disable_ibi_locked(addr)
>      function causing to send DISEC command with old Address.
> 
>      The olddev should not receive any commands on the i3c bus as it
>      does not exist and has been assigned a new address. This will
Isn't this the same device who raised HOTJOIN and seeking a new dynamic 
address ? you intend to have no communication with older device address 
right ?
>      result in NACK or timeout. So, update the olddev->ibi->enabled
>      flag to false to avoid DISEC with OldAddr.
>      ...
> }
> 
> Signed-off-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
> ---
> change from v1 to v2
> - Fixed the author name.
> - Unconditional set to the false & added some comments.
> ---
>   drivers/i3c/master.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7028f03c2c42..0dd8d1c28d58 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2043,7 +2043,14 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>   				enable_ibi = true;
>   				i3c_dev_disable_ibi_locked(olddev);
>   			}
> -
> +			/*
> +			 * The olddev should not receive any commands on the
> +			 * i3c bus as it does not exist and has been assigned
> +			 * a new address. This will result in NACK or timeout.
> +			 * So, update the olddev->ibi->enabled flag to false
> +			 * to avoid DISEC with OldAddr.
> +			 */
> +			olddev->ibi->enabled = false;
>   			i3c_dev_free_ibi_locked(olddev);
>   		}
>   		mutex_unlock(&olddev->ibi_lock);

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
