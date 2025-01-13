Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3933EE7719E
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jan 2025 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IziNrcj4q23rpjxmEc6kPxHAAUJfqVFK5EonZQolZic=; b=VCYOyehJplJw6x
	jt/FgRKdGdcm/+1tZQXFsWGZfsaztYNGCxf+h+d0WRIy7PM7dJvQT3iJQWlmd3HQJZlgOfySTLwHF
	9hPFRy7QcQye8L/tlaywbfmrVTqLVfHmDLD+cdsJXvyF/7L6nr0iRf9jeRaGnRHZYl7WGKah+3MvJ
	R7GlVwwaXfCnFU68AqmvezCtSOjPpj97sYuYuousCz2mbAKILKG1nR0WVPwgZ3QiKTQlHghrwYALK
	6IWfAIGvQb1iyQBTm8NfRSB3eGHA2oIIVQWiU2zSFGXPLeP7vzQCe8BkKeF6omaefGRJl42tqoH2h
	mfbxpqKPDzSzV8lnSfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHFx-00000004iXW-3ZnO;
	Mon, 13 Jan 2025 10:01:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHFZ-00000004iS1-022t
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jan 2025 10:00:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4WV0D007701;
	Mon, 13 Jan 2025 10:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ne3ZM4cl0VvRv4Q0cmPhXFnk41F7Udz9C7qYabYbqxM=; b=i/sP3WMJNCZ4TCvF
	fuazr63jDLMqWBYQd4ynR5D1hHTyMrD2mzxdh3RnDv4JEjWE0SJ5g2mRfMzxTeRq
	z4hiYzi+6uc9RWPjN24md+JIB9rbIx3L5MEmYo80w7nUkEYeZ1F+666qmxDh8GgB
	vjJBq3YAv1hPT8G8BHVH9c+2VR65WOwe/1jW8Ha4RvuKEQPxVMz4gcPYVXLb/jx9
	cSTizpNDZPZKgDm9I8RPvQ4QdXzDuFV5NiwsG2Q3UgpkrplcQb1Bc8Js+9ugUwi1
	m1xPiN+Ny2SFnxHWrBcqBIqtP5rb424jzeSy62Rqdx0aRL2MhkwpczKpQdt85AY0
	jHc8rQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444uw6gqu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DA0ji6008314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:45 GMT
Received: from [10.216.23.164] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 02:00:43 -0800
Message-ID: <f764b674-3396-405a-804f-a50cd8caa124@quicinc.com>
Date: Mon, 13 Jan 2025 15:30:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: Remove unused i3c_device_do_setdasa
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, <linux@treblig.org>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241221143418.86012-1-linux@treblig.org>
 <202501122254082b225acf@mail.local>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <202501122254082b225acf@mail.local>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CffRi1iRXZx4OYyqDvHtFhfagg-gTXnl
X-Proofpoint-ORIG-GUID: CffRi1iRXZx4OYyqDvHtFhfagg-gTXnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_020049_054521_B00081E2 
X-CRM114-Status: GOOD (  16.09  )
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



On 1/13/2025 4:24 AM, Alexandre Belloni wrote:
> Hello,
> 
> On 21/12/2024 14:34:18+0000, linux@treblig.org wrote:
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>
>> i3c_device_do_setdasa() was added in 2022 as part of
>> commit 672825cd2823 ("i3c: export SETDASA method")
>>
>> but has been unused.
>>
>> It calls i3c_dev_setdasa_locked() which is now also unused.
>>
>> Remove them both.
I think there might be few drivers in future, which can use.
The function looks good to be used.
>> (This is effectively a revert of 672825cd2823).
>>
> 
> 
> Yeah, i guess this just means that we didn't see the device driver yet.
> I'm going to keep those function around for now.
> 
Agree here. We should keep this function as is.
>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>> ---
>>   drivers/i3c/device.c       | 20 --------------------
>>   drivers/i3c/internals.h    |  1 -
>>   drivers/i3c/master.c       | 19 -------------------
>>   include/linux/i3c/device.h |  2 --
>>   4 files changed, 42 deletions(-)
>>
>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>> index e80e48756914..984976f28314 100644
>> --- a/drivers/i3c/device.c
>> +++ b/drivers/i3c/device.c
>> @@ -54,26 +54,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>>   
>> -/**
>> - * i3c_device_do_setdasa() - do I3C dynamic address assignement with
>> - *                           static address
>> - *
>> - * @dev: device with which the DAA should be done
>> - *
>> - * Return: 0 in case of success, a negative error core otherwise.
>> - */
>> -int i3c_device_do_setdasa(struct i3c_device *dev)
>> -{
>> -	int ret;
>> -
>> -	i3c_bus_normaluse_lock(dev->bus);
>> -	ret = i3c_dev_setdasa_locked(dev->desc);
>> -	i3c_bus_normaluse_unlock(dev->bus);
>> -
>> -	return ret;
>> -}
>> -EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
>> -
>>   /**
>>    * i3c_device_get_info() - get I3C device information
>>    *
>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
>> index 433f6088b7ce..842e1a865877 100644
>> --- a/drivers/i3c/internals.h
>> +++ b/drivers/i3c/internals.h
>> @@ -13,7 +13,6 @@
>>   void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>>   void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>>   
>> -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>   				 struct i3c_priv_xfer *xfers,
>>   				 int nxfers);
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 42310c9a00c2..000187339400 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -2916,25 +2916,6 @@ void i3c_master_unregister(struct i3c_master_controller *master)
>>   }
>>   EXPORT_SYMBOL_GPL(i3c_master_unregister);
>>   
>> -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>> -{
>> -	struct i3c_master_controller *master;
>> -
>> -	if (!dev)
>> -		return -ENOENT;
>> -
>> -	master = i3c_dev_get_master(dev);
>> -	if (!master)
>> -		return -EINVAL;
>> -
>> -	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
>> -		!dev->boardinfo->static_addr)
>> -		return -EINVAL;
>> -
>> -	return i3c_master_setdasa_locked(master, dev->info.static_addr,
>> -						dev->boardinfo->init_dyn_addr);
>> -}
>> -
>>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>   				 struct i3c_priv_xfer *xfers,
>>   				 int nxfers)
>> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
>> index 0a8a44ac2f02..f4e924c179d7 100644
>> --- a/include/linux/i3c/device.h
>> +++ b/include/linux/i3c/device.h
>> @@ -301,8 +301,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>   			     struct i3c_priv_xfer *xfers,
>>   			     int nxfers);
>>   
>> -int i3c_device_do_setdasa(struct i3c_device *dev);
>> -
>>   void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>>   
>>   struct i3c_ibi_payload {
>> -- 
>> 2.47.1
>>
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
