Return-Path: <SRS0=6/zw=SD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C16BC4360F
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 18:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03BE2086C
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 18:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kb9V0Yu/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b7SOtgOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03BE2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/mUAPTIPH0WG8VHfsytt3pWB35TIZqAM0mliDzAZZ0=; b=Kb9V0Yu/hllQWG
	I6eja5mXdy8pp3kIQKgHhQZ1IySxRqRP01rIVIPGN1R/YmSedPUyydblIIkKjtKwo7r8ss0+DGAwi
	X4vWMTTTkoOeewjopsZFGZEwynbS8cqBw69okRUJSLf7QLUWr8gPXrSV8sNtCuNoeUZ+I1+qcwA3u
	ANsc+Se59x9naf1+K+/tgkSPhEELmzP6Rd62A9wsK6XNyjjBAkXnNRYgIQNkMNrpgJpv57OeqERf5
	QqFNrXqAa1kyndWdQ6vJWRNZV63IrbdHpq7zekUOfvESj77ZpGyyXrxyEP70VIyahivD/bmoNphqk
	9uZoIWExNQmKYIl9LK3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1zN-0002Fl-Cf; Mon, 01 Apr 2019 18:48:57 +0000
Received: from smtprelay.synopsys.com ([198.182.47.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1zJ-00028r-8v
 for linux-i3c@lists.infradead.org; Mon, 01 Apr 2019 18:48:56 +0000
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id A925D24E2572;
 Mon,  1 Apr 2019 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554144532; bh=oy3ZzxWbxuRiBqV17gpBrRK/llXf35rE4na0Oz+aXNI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=b7SOtgODjpGKBoA3uEKF+7xQMN/EljdK+gN9fc5/0WsGDNqX8LRs5ObOidILWx6oc
 R5F3x/IoHPRXMdpiSSIiyqewi4RrIvGLiGFEttPBaaT0mWaKXC/b6B15bg4fFrOeTV
 l5RMCbvsrkfQvJIVHw05rlOUFDatI/UlDlxU56MgFtl/OstxT8Z9wkepO5lDIL0aue
 0Wq9vpMDKZMuhUZnt/Kl32ICB7OcIv8AGPpUvTUxjlBncimmpX+POJjqEyIBhN5wSV
 Cq8X5IUO3Zc223/HgnWZ4hFGg/uS5CLaiAxfFzE2J+mWFI2F9RnasQqSkXP6R3YwOR
 E6vbWUb3O8E2Q==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8CB6DA005A;
 Mon,  1 Apr 2019 18:48:52 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Apr 2019 11:48:52 -0700
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Apr 2019 20:48:50 +0200
Received: from [10.0.2.15] (10.107.19.140) by DE02WEHTCA.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 1 Apr 2019 20:48:49 +0200
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
To: Boris Brezillon <boris.brezillon@collabora.com>,
 vitor <vitor.soares@synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
 <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
 <20190401203148.028cdf01@collabora.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <2257791c-6bef-3015-664b-470ebf55b726@synopsys.com>
Date: Mon, 1 Apr 2019 19:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190401203148.028cdf01@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.140]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_114853_788598_F4AE76D0 
X-CRM114-Status: GOOD (  19.78  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>, agolec@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

On 01/04/19 19:31, Boris Brezillon wrote:
> On Mon, 1 Apr 2019 19:17:03 +0100
> vitor <vitor.soares@synopsys.com> wrote:
>
>> Hi,
>>
>> On 30/03/19 14:36, Boris Brezillon wrote:
>>> On Sun, 10 Mar 2019 13:58:38 +0000
>>> Przemyslaw Gaj <pgaj@cadence.com> wrote:
>>>  
>>>> I need to store address and lvr value for I2C devices without static definition
>>>> in DT. This allows secondary master to transmit DEFSLVS command properly.
>>>>
>>>> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
>>>> ---
>>>>  include/linux/i3c/master.h | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>>>> index eca8337..3c27d9f 100644
>>>> --- a/include/linux/i3c/master.h
>>>> +++ b/include/linux/i3c/master.h
>>>> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
>>>>   * @common: common part of the I2C device descriptor
>>>>   * @boardinfo: pointer to the boardinfo attached to this I2C device
>>>>   * @dev: I2C device object registered to the I2C framework
>>>> + * @addr: I2C device address
>>>> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
>>>> + *	 the I2C device limitations
>>>>   *
>>>>   * Each I2C device connected on the bus will have an i2c_dev_desc.
>>>>   * This object is created by the core and later attached to the controller
>>>> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
>>>>  	struct i3c_i2c_dev_desc common;
>>>>  	const struct i2c_dev_boardinfo *boardinfo;
>>>>  	struct i2c_client *dev;
>>>> +	u16 addr;
>>>> +	u8 lvr;  
>>> You also need to remove lvr from i2c_dev_boardinfo and adjust the code
>>> to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
>>> patch 3.
>>>  
>> Why can't we keep the lvr and addr in i2c_dev_boardinfo and need this information on i2c_dev_desc?
> Because i2c_dev_boardinfo is extracted from the DT and the secondary
> slaves does not necessarily have this description. The idea is to keep
> reserving the address slot for the I2C device even if we don't expose
> it to the upper layers.

So you are using i2c_dev_boardinfo just for DT devices? Because at end we need to register the new i2c devs.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
