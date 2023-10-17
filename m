Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B66BC41513
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79kvXSMtSc2vg4mADoqqisIuVJAJojdD7IfcZos5t1E=; b=LUE5QAEZis0zluiBKGxEMGGhaY
	faCLb+Z90yrOiWnEUOnccovEnOBCsHq01j7UVnAf5AleK4dC0+ynO9s972fIr+yzbJQ9DCxQpl1et
	u570Zbg9eFTkSt1fKrV01y0GiMI0DmUBrqiX8yHKOTHY6EkcJMX1mMymJtlGZbTL7HUGYKj8cAgfZ
	QsqlKUfblhFN9yq8EUyqsFMy51bjxx44uAmKo7IHZTv6bnJ141LpNu82iWr9uy6fhAzJnMRjwfhJ6
	lO5fS8ZoPS5mams6t9w5Hqhvl2zufyEKwJU5pMOIjyXO9avFHXQVaIgXeJFFN4YTWhn3FkigLkwv+
	cNi8cXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdI2-00BMyk-2J;
	Tue, 17 Oct 2023 06:10:50 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdHz-00BMxb-28
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 06:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697523047; x=1729059047;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=fvSUNe12MrPApyrnvzaikJXkNdd9PaAh1gP0bEv8+3k=;
  b=DdE9HVVGENs+zH84o9Ssuu9o9g+zAdqmmrTq4ugCy7DzOKeSdB9pt1vP
   UanubGxK7MaS8ULWliGjC1pyTZejoDXGSSiUo9h8TlEET5Hr2oDOqrVFX
   XlJrWEmZubHJpnDH8YqkqOiLqK2IZzl/uwMA8rqfhI/gzu7fCXRHl8mko
   M1rTgoNxeT4uXluLRayyWA/dgBNnWzX+5KLMF/m69i4OzGd8pP/YSD3N3
   sXV+azxoi7JYa+m5p7N598iUC1k7KWm9vdjVV9pHHCUMMp3jiLuv9Zzkz
   O3P7JysAX05mQRNGLSkEiSjafD1HLmCj/CoZPhy5VUP3N9Et8I3JnLHW4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365059483"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="365059483"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826303833"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="826303833"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 23:10:32 -0700
Message-ID: <696dbfdc-1b08-446d-8983-dda09d861f59@linux.intel.com>
Date: Tue, 17 Oct 2023 09:10:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i3c: add actual in i3c_priv_xfer
To: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 miquel.raynal@bootlin.com, conor.culhane@silvaco.com, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-3-Frank.Li@nxp.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231016154632.2851957-3-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_231047_708901_07A5D24B 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkKCk9uIDEwLzE2LzIzIDE4OjQ2LCBGcmFuayBMaSB3cm90ZToKPiBJbiBNSVBJIEkzQyBTcGVj
aWZpY2F0aW9uOgo+IAo+ICJOaW50aCBCaXQgb2YgU0RSIFRhcmdldCBSZXR1cm5lZCAoUmVhZCkg
RGF0YSBhcyBFbmQtb2YtRGF0YTogSW4gSTJDLCB0aGUKPiBuaW50aCBEYXRhIGJpdCBmcm9tIFRh
cmdldCB0byBDb250cm9sbGVyIGlzIGFuIEFDSyBieSB0aGUgQ29udHJvbGxlci4gQnkKPiBjb250
cmFzdCwgaW4gSTNDIHRoaXMgYml0IGFsbG93cyB0aGUgVGFyZ2V0IHRvIGVuZCBhIFJlYWQsIGFu
ZCBhbGxvd3MgdGhlCj4gQ29udHJvbGxlciB0byBBYm9ydCBhIFJlYWQuIEluIFNEUiB0ZXJtcywg
dGhlIG5pbnRoIGJpdCBvZiBSZWFkIGRhdGEgaXMKPiByZWZlcnJlZCB0byBhcyB0aGUgVC1CaXQg
KGZvciDigJhUcmFuc2l0aW9u4oCZKSIKPiAKPiBJM0MgYWxsb3cgZGV2aWNlcyBlYXJseSB0ZXJt
aW5hdGUgZGF0YSB0cmFuc2Zlci4gU28gbmVlZCAiYWN0dWFsIiBmaWVsZCB0bwo+IGluZGljYXRl
IGhvdyBtdWNoIGdldCBieSBpM2NfcHJpdl94ZmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+ICAgaW5jbHVkZS9saW51eC9pM2MvZGV2aWNl
LmggfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvaTNjL2Rldmlj
ZS5oCj4gaW5kZXggOTBmYTgzNDY0ZjAwLi5mMmZhN2VlNWQ5NmQgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9saW51eC9pM2MvZGV2aWNlLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2Uu
aAo+IEBAIC02Niw2ICs2Niw3IEBAIHN0cnVjdCBpM2NfcHJpdl94ZmVyIHsKPiAgIAkJdm9pZCAq
aW47Cj4gICAJCWNvbnN0IHZvaWQgKm91dDsKPiAgIAl9IGRhdGE7Cj4gKwl1MTYgYWN0dWFsOwo+
ICAgCWVudW0gaTNjX2Vycm9yX2NvZGUgZXJyOwo+ICAgfTsKPiAgIApXb3VsZCB0aGlzIGJlIG1v
cmUgY2xlYXIgaWYgbmFtZWQgYXMgImFjdHVhbF9sZW4iIGFuZCBwdXQgbmV4dCBhZnRlciAKImxl
biIgZmllbGQgaW4gdGhpcyBzdHJ1Y3R1cmU/IEFsc28ga2VybmVsZG9jIGNvbW1lbnQgaXMgbWlz
c2luZy4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
