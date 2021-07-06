Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB6C432BE
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE42A600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE42A600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zXDyK70TYs5TBlmwNC3MDt4mDPPE5qEOp+pswfkGzA=; b=xngPGOzC4hNuBnNZa5NIDv4Ze5
	BSD3vveA9JQaXDCHR7x5ecMiK8K18ihttTDddfGfJNyDtDEp0hThFpbddkvP8P60X4Lo+fqZnqVVr
	JxZgqTuBqtq55Y0ZnaNx1Iy7iOAGxjshnmXKXJlWtq3Mm1OmRKcjF9KFOYYqLsh6luIoGtcz1ewWl
	KIMNNEyi4X39q1FFcRBKHU6we8BEQEhE4ti9YAyWvBMlbSkfmH+mrEdn/nlQsFNE8n3pwFYZvPydb
	32Yr0NP7Z3qFNz+NScOKcL1b+5vAm4JAnHJ+NBOGTJe5RvgsDXQJeak+gTBpdPkKDeLal7A5wsgge
	gENJKf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMu-00A8RL-C2; Fri, 30 Jul 2021 19:40:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0jTK-00BUTK-Af; Tue, 06 Jul 2021 11:42:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t3so27586216edc.7;
 Tue, 06 Jul 2021 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=TwRJy6+J3urIn/EOHkX70XQHrPpIXFIOoiquz6eJSwyU/SQIQ4dADKORnRQAYcVLDd
 bGmCH+O3vZ/zwAN03+xnrlCOWn/T/Pz6KfPYlHzOgGXWb72eEAEAjVLMxY3sV52LOQiu
 4sMepvP8f2M/NuGTEEUpcS9djTSXyNUocbOOHuCxDZ/swc4Yj2krBjOK18+xBOWwYw7y
 O/LcWjnu0kdZ4pmyv7jFfFo0qSdeTOdmtP2CciCXwcdnQ5FYkYueWY1vZLSQqxLbXVdx
 xHWyXJmiVDLrlTvE9QGQSNArUJUGdY04ySHX3mfxNurDFI1sFLhNw1IKyh/ZzycJEC6f
 piBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=GBLcBf9sPLiXtsqA8rcB6Skdcdf3YNpGI2JMYm24MIHLTJRpRKO0c985TCrzHJNpQJ
 xHD9onlAm2zTDyiUBvUC9dpTrWlFWb1f0jpqUJeY5XY13BH7Uj0AIaO/ZJZcX3zCsu81
 nKnAxpqQfRz7lOkp7OH+MxU8K8EWF+9zsbiifALaXtSIYeGdanLvOimbibVrwZsnepSs
 lDv0621X64dzzon3c566aDPix0u1Hj6oEqHaLRyvboEhGLS0JSV2+2mJf+Aj4BHsQuXI
 9BzHLQi+A19G+Ur5HcWvSen8vE2G2eizZutnjePJobAhx7qhAhzRsrkKj7LpelaJrVf1
 QiJg==
X-Gm-Message-State: AOAM5308JqiOxFMKnnGxADA6fpilW4H3TZnG1oKBvTvvmbfovcYsjr33
 a7gJizXN1wKKlMl7lK4OYRU=
X-Google-Smtp-Source: ABdhPJwOR9RYbuFI1V8zYqZEcawlLdGKboqfR9DJ6TrIpurxtzPOHwaABH2lGpOOBvACTZh8ZOEU1A==
X-Received: by 2002:a05:6402:1c06:: with SMTP id
 ck6mr22330893edb.287.1625571755735; 
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a48a.dip0.t-ipconnect.de.
 [217.229.164.138])
 by smtp.gmail.com with ESMTPSA id eb9sm5646083ejc.32.2021.07.06.04.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <mgross@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross
 <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org,
 nvdimm@lists.linux.dev, dmaengine@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
 industrypack-devel@lists.sourceforge.net, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, linux-pci@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
 target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <07c08230-6c71-2a73-c89f-05b9b5de78ab@gmail.com>
Date: Tue, 6 Jul 2021 13:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_044238_427571_50E2C1A2 
X-CRM114-Status: GOOD (  18.19  )
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:20 -0700
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gNy82LzIxIDExOjUwIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgZHJpdmVy
IGNvcmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVzZSB0
aGVyZQo+IGlzIG9ubHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVhcnMu
Cj4gCj4gVGhpcyBpcyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAgcXVl
c3Qgd2hlcmUgc2V2ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZv
aWQgZnJvbSB0aGVpciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVzb3Vy
Y2UgbGVha3Mgd2VyZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1cm5p
bmcgYW4gZXJyb3IgY29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdvbid0
IGdvCj4gYXdheS4KPiAKPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmluZyB2
b2lkIGl0J3MgcHJldmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1cm4g
YW4gaWdub3JlZCBlcnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3JvbmcgZXhw
ZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKPiAgIGRyaXZlcnMv
cGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL2J1cy5jIHwgNCArLS0tCgpBY2tlZC1ieTogTWF4
aW1pbGlhbiBMdXogPGx1em1heGltaWxpYW5AZ21haWwuY29tPgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
