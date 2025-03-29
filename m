Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DEC3601A
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cwg67c82yG2QAZegZ+KVpWaIPu+NmLHF2Z3HSutd8qU=; b=eJYFfuPBLubjmS
	q8t6b7ckAa/GROQT6y4lcHqcma73Lb+zs7rSc5I0GlAib+l7iS1ReQ3uUWlAV5pK9pSZ5U8NJz5aW
	yxgi7CKkW3o4vkQvp88feJdpqbdlD+7lAphlxeIvqVxfnUlu3JeR0cQTj42w7KFbXg1JnYcmjz2F2
	mKTBk+1g0IzDgVYLM5YsVS5vWVLGp4D/I5/XkHW6CH/Ds0YxGCaMRws0eY03JkvbEPi6+lGOAF0BM
	E5IBnLQlAA5SjOVlyITSL1aMKj6LAYe8esiX+fVyGp6a1FkTj+fOHrOdKx/UtIhtNwbzsXdefF+KR
	40smI6onfAUmXx2lNRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0F-0000000Hb3Y-0x2p;
	Mon, 31 Mar 2025 10:04:23 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tySk2-0000000EzOD-04Vf
	for linux-i3c@lists.infradead.org;
	Sat, 29 Mar 2025 09:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743241453; x=1743846253; i=markus.elfring@web.de;
	bh=NpYGIKkcP8FuzmyAH41B/chvu9TNL827CMF9ATXpUPo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FZDpjpIquws6DbOTBq4uI3MjSkFFC4T7UVggRgE+uc5E6g2jBJu7Z9ayyGBRLxbZ
	 M9wvdwKq04aZyviwW0pH9IcQIVvfH7sAmfdTe/ROiUGNHr+tHvTX+ytdmvIr0EXs9
	 Tn49Sd0iATk2ro1W4IaIMPMwrQpcHVogbOxcbzQSDyrVFgiVr+1a8N4ZrbzcECplz
	 YK+0SC0Yh1qzcwDYt0BWTBa6WtbSVfO/UcVWhARsZeK4le6S1bsN4+3/YZGc2sENZ
	 +rWN4LIcGbP1a8bRXDIrL+QSiDiAemGKkPmVifYmg36It1gSPtUePObv19NE9Kazc
	 UIb7fOG2rGSX2hfRLA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1tgnKH0oxk-00KMx2; Sat, 29
 Mar 2025 10:44:13 +0100
Message-ID: <e728a653-dc12-4d2b-83a1-a186611c85be@web.de>
Date: Sat, 29 Mar 2025 10:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
X-Provags-ID: V03:K1:z67TAXeP44W+MI1/J0Ked3QHpXbkEo1eSqgzBbDctYPJ5NRtASY
 CCmeECJPFDIWo8Cz/fSfQLIzOqFGxRirRsJitVCE0fRp2Qk25aagj1E9E9PPv75kaTfqpXK
 nHsxjMOHygrxazsLGFF8YdBcw42ZwzxkIt+BeK2E8gY/fkpffAPUSwS443jWQRQTIHMDRAl
 LYaBYV1sky4DqtfUOB7yQ==
UI-OutboundReport: notjunk:1;M01:P0:P2xTt15EqkM=;yVihSDPxUx52MIgMHvo62uDWP2U
 dASAyom4+iK0ZYQTPGAqqhaG6qtXgx7fPWw90HuTWVStXDxyWJBj/b59jAw9OpZvR9hD3cBbX
 BSzAqXGLnMxBURBmkaNv3gei9Fkxwc+bJLxYnnkrDWiFIsriLcPETWM7RT+1rbeZeY5YYX0qZ
 xoV7hSOVT14i0SitPYY5XWR/rxQlN5jKhXwB5+8OBIEoFeQ8UVe4FY6VurC+8hEemTqNIHY9y
 DfVfHOg1xsgp65vDC8f20qTIg0oWlgBJmG+Zp88jB8dEGiG0deA+w18uxPEAio/T0PSvFPFyL
 +jlkUKoVN5SKR7xzbHWBdqPY88jmNP4lg0treEaI5w2kZkCe6zITH39hIwgQWMMUS+f0h4Q75
 42mabwI4FO/XGfci9572ae+PV0A0EKlseMmVZSt/vpiU0VEooeMUCi3oiTMDRKho+OMQ78+Ba
 ZAKHsI+YQGP3OO1rYdwX6M0fuHTjW3g5aDSx0t0+E/iTQUu4gByf48RO2yJUpaC4LItz1/P/E
 b4Fg6DpLkvAkZt2K9HXhS5IMTdSOEYZPG+yYwUzvOPE+LknCuR9k3hk/uYDlH3v+yOZ00SRah
 Z1/twVs8BeO7iFyPqFPyRIe9ZKL92Q+ctmA9z+toF+8cDqwFZ/3sYsHofi10XNPDiqC8S3VGI
 OIIDS59lCJyvU0lkJxKx0EN9OH5yBbRFXWgxERfVJZN8ctTbw7NShECm0EegywaONCB7eE8Ku
 RVMhY+pE5g6BgdXa/Tn3aT3u1uoXx+eF88duxd/lG9rDYFeL9CFSh4cKv+3Ou8Z5K02wZvoNZ
 qWo5BQgR9X4Thghcxd1qXAKTW52v3KB8PFTwo1hzyvlCTe6cObG5syvpgokc8oezAL4kltbmC
 MRfOUnN+3QxVgcYSYotCRWGmXIAMjTm5iYIvzrfK3pfDif30QLlYR6YYNbWfKYzJkGlNabZJf
 M0smoyYn6AUjjmfGlIKb00SxyOHH+ia4+TPL3l8wf1kD+LgdV4I1cs67cbHZOERg8VgZtY4/B
 RoKJBRU7R3lNTvIEZEXpWoEzPj2bHlJvqYBi7Qj5rQqsL/QsOdyQ7fXCXkj/O2XGamG5lOwg/
 oiuRFf4l8i/6nHlSmqM1MLKAVcF5tEuDQseQV83VINw93SDQOD75ENS5gxsj1f1X8CZ+E+2qz
 DPvwmGwS4kJhLv2cpm4u/z5thoWorL9hXb4dBinn/4nQNS7NlswZtWsmNfFNSRgWpodBlL7x2
 E7e2s9uyndqqPQYJ6io/pHZ/NiY3HOwwyvv8QzJblLYiLKseoRJc1HGXggUgjEh4bkG4wBjdr
 KhIujoRjDTQLTolZVuNOpwqIrET/hcqPY+QIuuc5rWfaQjAHRbXRsdG8/T6vkgqphuARQVxWH
 piGjXf73ZNsE3oCsxNDVGC3PkGxgzIVbpgw0HDeKcNfqKiUHZ+/IJNAZjdBw/kGZKrDH3jRlC
 PjX9s1pIVGzX5wlkxA+t+MxfoBQu68u4EnyeuZ0b13rIg6wGN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_024438_363040_E7074B01 
X-CRM114-Status: UNSURE (   3.92  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 31 Mar 2025 02:45:26 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Pj4+PiBVbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUgaW50ZXJlc3Rl
ZCB0byBhcHBseSBhIHN0YXRlbWVudAo+Pj4+IGxpa2Ug4oCcZ3VhcmQoc3BpbmxvY2tfaXJxc2F2
ZSkoJmdpM2MtPmlycV9sb2NrKTvigJ0/Cj4+PiBEaWRuJ3QgZ2V0LCBoZW5jZSBhIHF1ZXN0aW9u
LsKgIERvIHlvdSBzdWdnZXN0IHRvIHVzZSBERUZJTkVfTE9DS19HVUFSRF8xIGluc3RlYWQgb2Yg
ZXhpc3RpbmcgbWV0aG9kID8KPj4gSSBwcm9wb3NlIHRvIHBpY2sgZnVydGhlciBvcHBvcnR1bml0
aWVzIHVwIGZvciBiZW5lZml0cyBmcm9tIHNjb3BlLWJhc2VkIHJlc291cmNlIG1hbmFnZW1lbnQu
Cj4+Cj4gU29ycnksIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aGF0IHNob3VsZCBpIGFkZC9jaGFu
Z2UgPyBwbGVhc2Ugc2hhcmUgbWUgc29tZSBleGFtcGxlLgpJIHBvaW50ZWQgZGVzaXJhYmxlIHN0
YXRlbWVudHMgb3V0IHNldmVyYWwgdGltZXMgYWxyZWFkeS4KClNlZSBhbHNvIHJlbGF0ZWQgaW5m
b3JtYXRpb24gc291cmNlcyBvbmNlIG1vcmU6CiogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTQtcmM2L0EvaWRlbnQvZ3VhcmQKKiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1rZXJuZWwvP3E9c3BpbmxvY2tfaXJxc2F2ZQoKClJlZ2FyZHMsCk1hcmt1cwoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
