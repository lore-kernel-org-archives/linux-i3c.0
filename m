Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72715C35FFA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Mar 2025 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYjkCNarN/YC+v3tOKaWVoxf8KtAoQekjkpBPxq69bo=; b=urgNxvybRlmSBW
	er+dXaN6vH02JtPU6Ve0fHxIjIxF5QvxAAtoGO6NxudZCJFNHUdFcAdct/mGsTCVoBhRgNH0wxbHR
	FYVzu+spS/pW8N4QNhKxFZVXEA0U20tT8YBkQxneCJ9ba+YA0D9GKbq8QI1G1r2Gwmv7H2VAnDWKx
	rAeaogn3+qenCNGsjHeDukpXg1z7a9P9gmO/g1vHryOJjzeptWc17Ik3Q576K7kXpxO1T2VBS7CjT
	/uPiBQceQO47CAcp+SNClvfWQR3Sci7Q5NbB9Ig0OGeZKT7lvQdFUv0nBm2LfyDwrDGRAjp0fC4gh
	HHORW2bGdq4FSFNq97HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutKE-0000000949r-0tnZ;
	Wed, 19 Mar 2025 13:19:14 +0000
Received: from mail-vi1eur05on2062c.outbound.protection.outlook.com ([2a01:111:f403:2613::62c] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutKB-00000009492-0HhD
	for linux-i3c@lists.infradead.org;
	Wed, 19 Mar 2025 13:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WysNIKCbmASNq/5tnT5wulpKtKEvRMeYbWsUHHwdnocTtRDrJ9kY/SVbGmZfpf/vE/vy0SVHgT+R1KpcTsJN/38fI5Gti42gA/DS8oQp7WOT12ZMIsei2STn14Un2rgOGDRIT4XlRqvsjaDM1aaMWpcpcA2JA8msoFd+0CbmYr63u3yfkoYEJ93FuXdY9S/xu0g7u+ahePPGRfvuTHLEOGOfLP1FOsFhxjhEUga8X7iodAFH/DaIeX7KIri6xo8Tkr7AqJ2VPUOG4ixnP4YlEfBpVCDY4e3yBN7QJPNGGQuKDlcF0eHW+MvQsT5B1leVZmDpPJ5baP8bH2VWbXsOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzKD+LskatwvAfUukScPOk0bolwN+f9EvuYzpSi32jA=;
 b=Jsk9r6D8VcDw+2J4MqmGciKg6apHXagh9yJlwSck+s7U/vym3HLBlhPI7qc72PjzG2y0WITp2jDtdYfEy6DwS+rm4+4xXPN4GK4hAz0v+GXIHNitvIywok/LEDIGT0WOwsN7v5KZsE9ypW6oDxomx633ccBIr18a/K5sYa2bSotKaiJa99k6JXrI2nRcZjely1jlk/2TgttrBOF9Mg6Bz/Zm7tvcduyc62MmIKHY4PjOnR72tB1P6gVrSWLXxi2+2+fbJPqiOjTWbTJt/KmqjupPNYyNV+RJEeuQ29lZVGInAnwJXFbIIiSsPmsfakvFL4FNcFYeQvz9EqP+3l/ZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzKD+LskatwvAfUukScPOk0bolwN+f9EvuYzpSi32jA=;
 b=kWPfYOq4WUQz1BJn9T/IK3MDHQ9Mtt1hIxEZFwlYeL5fq+r36sqDGSgnky18nIPqRPefwKsn6TkU7g2svvPThPQEODgpr7VR3Hhld0M8pKETdzaiIgm6CQq2mc6QGkOKXgYxnETcP7XC9yA4moAyOet+qNP2InmO6iYcA44FpMr2RLqesgyqkH3X4DSsGKErVT2c1FnX7oXadsEpE1a2xeGE8VtFnLiGlk4ol31iLNPkdx7u6iYm/tXVNGc9zFiOJfb1j/Djajzv46lGG02BvaPayxUa1gxxQaMODU7Ot/ARr21fFeJWTIP8q5U2FQW7t+yjr192eX0IkI65vy8XTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7144.eurprd04.prod.outlook.com (2603:10a6:20b:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 13:19:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 13:19:00 +0000
Date: Wed, 19 Mar 2025 09:18:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in
 dynamic address assignment
Message-ID: <Z9rEPLAmxrqP61sz@lizhi-Precision-Tower-5810>
References: <20250317101516.19157-1-qasdev00@gmail.com>
 <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>
 <Z9mGK0x8fsWvbTvo@qasdev.system>
Content-Disposition: inline
In-Reply-To: <Z9mGK0x8fsWvbTvo@qasdev.system>
X-ClientProxiedBy: PH8PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 2010f076-85e5-4319-36dd-08dd66e89ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3NlSkJadlByazdyN2xrSVJHNGFYcERnV25iTUozeEo3b3NOYTZreTRVUzB3?=
 =?utf-8?B?MEo0QUZHeXR6b2RyTU5JTGZsRE43VHJwbHpmNlNlbG9KTjNLSTlvek5HMGZm?=
 =?utf-8?B?ODJQZ0wwZVJIWE1xb1drZHV0a1QrK0hUNXlLRzNZM2hMSUdWOGo0aUhZNzJa?=
 =?utf-8?B?OG5mby9HY0o5VjM3SVFGM2QramZLS1AzYm11ZWUyNE9ISkdPNUhHbTRjbDVG?=
 =?utf-8?B?U24rMFhZRTlRZlJlamdoVHc5SU14Z3ViczFuRmRaOUNCSmFKSnJqWHp3T1dy?=
 =?utf-8?B?VVhHRDVkc0ZKbTdKSldmbnRnWXRUbTVIemdJV3RYSFR1cmVDNFZqZDdRdm9r?=
 =?utf-8?B?dk5ieUdLVHRkYm1UdlN3OTNadldqOHlDdVZxY0JnUjV5VVRrWGRjZUsxTkp4?=
 =?utf-8?B?ZlQrTFNlV1hiRmtvU0V1MThYT2lHcG9IQlRaeWQ4UzQvQkZoaGZIM1cxUVJC?=
 =?utf-8?B?QWxpNmJsY0FuTitZQ1FzUGNBbU13TU05RG12alRObDFRVy9uYlF6R1ZHditR?=
 =?utf-8?B?TXFZTHVhTFhMYkszZFRZVGdQa3pETmJVK0VydlRjb3ZnSUMvN0g0SFBwckx1?=
 =?utf-8?B?VHA1TzZ1K0pXT0cxNDhwbUpwaDd1SjVTNTBFZmVqUGM2R3k1cHRXRTdwZ3hh?=
 =?utf-8?B?SUx0ZlIvcWhRUk5TdXhPc3ZQRWw3VEZhbHFmNDFGZm5VZjczekN1eE53TGZO?=
 =?utf-8?B?RWhmL2NBNE5BTFdmdy9ieU5zQzhXSFV0TUsxRHMwd0VFb2NTUytVSjBJUXBy?=
 =?utf-8?B?amNPaGpFMGJGSngvRGpET3RjMXh5eGhoVDhaVUkrWFBxMGp1NDNPMTBlWTRF?=
 =?utf-8?B?Ly9jWWViZ1JqbVowK1huYWNIVEdCVHhuTHVDUFBCajVIcHU4UnBiclJVV2VH?=
 =?utf-8?B?enkxVU1IUDJjbWFYd0JNRDhxUmpGazVCZzZaZy9xSGRscWdEeDZlazZIa24r?=
 =?utf-8?B?WHB5QmhKeUZkR05odDFFckxnanJFWTM5R20zUkR5cnBiMkwvOWswS0hRcVlR?=
 =?utf-8?B?b0ZUVGNPNjJ6NEVJbHRFQWNjMVhJYnNxYzBmSEp1alJObm1RVlpjMkVjV2xi?=
 =?utf-8?B?MjNhZlZadnl1V1k0K3IzTnRCTDRwSnUzN1JGZFRadEpZQitNcW85Y1NoK1ZC?=
 =?utf-8?B?TkgzU2JRcyt3Sm9ML2tHYVhmV1lnUEh2ZWovMzFhUFRCTG1kaWI0REVqRVdJ?=
 =?utf-8?B?V0NaMUwrM0FzUUR0bWZzOE9RUGZUdmI0a09odEViODJBV29VMDJTNkI4bkk4?=
 =?utf-8?B?bmhEUlIwdU1YQm1aMytZOG5ZV3IrVXRmeThyQVlBbHphYXdUbmJBcVU3aHNw?=
 =?utf-8?B?aHBtWmZ2U0hZWFJkeTVvc05XU0pjeU4za3VRT0dvcXpYaVMzMk9HYldBdzgv?=
 =?utf-8?B?S1I2RU5MZ1N2Wm1HWDBUeTBNYjhHeGN5M0ExMUp2QXlQWElHUll1c3YxVmJF?=
 =?utf-8?B?alZkdkgwdGh6TjlZVktqM1lobnhBZTUrNUxZaGlHQ3R2QS9oRUJNMVVISkFZ?=
 =?utf-8?B?TjNBVnBwY2VXOVVhTkowa0djNzN6TFZmNVc3QXR4UkY4c1VySjFoOEZDM3BK?=
 =?utf-8?B?d3JIMXhzUnJkVmpWTUpDMjhld2x4dlZhSzlYVnZsYmdZVmtBWEtIZ1hZTy9Z?=
 =?utf-8?B?SDZrOU9XM2F2enhuNmI5UVV2K1V5UHB1YmlEM09tWkoxQ0FNNzIzN0xJenlQ?=
 =?utf-8?B?Yk5lT2RQa1pWTHoyUlh2d01TRXJ3WTkzc1NHRE9hNHlNSVZQU1c2SmNBcS9o?=
 =?utf-8?B?NDF3eUlLVVRGRk5mZ0F3N2VVV3NJVm5oTThpemIrbnVTeFRvUjVKWDZVUldN?=
 =?utf-8?B?ZDRWSDV1ZmxPTGx4dGs5TUxhbUhwOXo5ZXd3RnduaE9ZR0t0cnFQbUtGa1RU?=
 =?utf-8?B?OVF3clJyblpwb1BHZUhCRXFDNWp3Q21qSjRydGFzTTRaQUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZyajZzRW4rRXBoWW1xa1g2MElJNm8vMVUrRTN4R3lMbGV5RHoza2hsOXRY?=
 =?utf-8?B?NStPQUhhUlkybUxMNGxselRZeXFJNk9KWGZnTElyQzJ2QWJpU0hDazJPRGRO?=
 =?utf-8?B?RGNsTndpS3hoblVCcVBPV21FWUtnVVU5eUhkV1o1czFSdGVzdTJQOEtzLzY4?=
 =?utf-8?B?aC9udFZ6SVdGT1c3eDllZ1lFaElIMlFGUHQ1ZmRONTVBem5FTnZBeFFnRFdz?=
 =?utf-8?B?OXJSTkxrL2daamczSGRRdzREaG50Q2FicnpXSkFzYTZyb1ZvcnFtZFhueFMv?=
 =?utf-8?B?ZG9GNEJNTVVVVWhDdm9CRHVGVDlzTzI4b1h5SWtXQ1h2anY0d0k3am9ZWTFw?=
 =?utf-8?B?bzJaRHlsYUFMcDUvRzlUcU1kallBYjlodHNMVnV0ZDR5ZTU5Z2hQVm9HdFBw?=
 =?utf-8?B?VlBQeU1GaG9XemI4OHdQRTRqclFTOWtLWDVPSkZadTU4dlMxSmFQMEpERkZ0?=
 =?utf-8?B?OWdHR2dkbVJmVFB2Q3lCaVlNbmR1OEZWYnR1YUJyWDNsQVJXNkZ4bldkSFVW?=
 =?utf-8?B?cVZlNDFNSEJTUFlHQ0pFSklBbVpxT0FSTmQrc2R0WUl3T0ZwdXVDam9QVUx4?=
 =?utf-8?B?TTZSRmJvOUVVdTZUUzBUV28wTW1VemtrbXZabUJBdnhWWXdhUlZIdmJvYjZ2?=
 =?utf-8?B?a0UyVm1tVGpZUTFKUzJOa2NiM1RnQmlGMXlqRkZOMzU5VWVIOGFoV2w4NjRF?=
 =?utf-8?B?NFhtcloxU3dPZWs3akZaOG1mbDAyeGlCTjVUcXJOd0gxckFvbnRLWDJOSTY4?=
 =?utf-8?B?dWMrRy9oWGRPNXJEZ0lpZm15aWVJRzhDUXhvaGFFRXF2OVpReUN1cGNlTUxj?=
 =?utf-8?B?RFR2YTZTOVVodW5jK0Jib0FTMUNEcEROMThaNmJIL1VwS2FWZDZ5azMrbDc3?=
 =?utf-8?B?UXhtMmw0YnJSamJCWGJYdHhVUUduVUplQndxby9OVEpNajJsWEVtc0U1clpr?=
 =?utf-8?B?N2pPaDdjS1NhME1YSXVtdk5UaVAyVmkzU2JHTVVmMGM3cnJKT1VGb2hFbFRz?=
 =?utf-8?B?emxPRmxMVWV5ajQ5MlpDMUpiNXdFdjdaTVl3a3F3bDJEQzNUTEZJY3VCY3Vv?=
 =?utf-8?B?a2JqT2Z2ZTVQcmVmaVhpeTI4WWRSRzNqajMwTnRWdDdKYmFQSml6KzQrQS9V?=
 =?utf-8?B?SkY3Uzl2eGMzQ05YNlBiZ0lqZ0VZaVIyWm8yNE5UVFhlN3F4bExGZHdOZnVN?=
 =?utf-8?B?WXVpSnRHcHNsLy8vVEp3REF1WFY3VGFyVVF2c1dWQVlONEFDZDBCNmVMZEdS?=
 =?utf-8?B?RDhac09BaTNjQktOM1ZjN0dVR1lLaUt2V2w0WHRHRmhGa0dnaTQ1SFJwaFJG?=
 =?utf-8?B?ZzIrL1pQbVpZNmJySnlHMWY4TVhpcHd2ZzlJU1IxTGovM2cvSVpQVmlsRlcw?=
 =?utf-8?B?c0owWUFKMTlnR2xwTVp0VnBibFVyTHNTSHdhNGJRSjZBdDUvczZTSFcxZFZL?=
 =?utf-8?B?bGpMYTFJQnQxREN3N2l4OWl1UDZOQm5DTDlpcGZvdzJlVzVzdEZ2OS91eVM1?=
 =?utf-8?B?MXh2dEQrR3F4eTNnZnROTGlxNVNjTXAwRFhWdVJxd3Y1THlTWjJEdUR6R3Bo?=
 =?utf-8?B?L2ZJQ0IyNkc1WERrUU1uMFByZ2RrMk9kOVlKYWppRiszK1VaWDFIOUJXeEp6?=
 =?utf-8?B?LzA2M3BDelY1aXRQWnJ2SkFYZ29OVy9zNHg4bWhabkJPVjYrQ3J5YzRFVmZs?=
 =?utf-8?B?a1RHZWNuUS9uaVNaWHZJR0VkTjdwbGdwaDZRMDUxazZXejMzY011QzBUdk5p?=
 =?utf-8?B?Z2NkTzJLakI5alNyWFJ4WWo5Z1BwOUREcDlMU054UEF5bU9GdGlnaVVySG5j?=
 =?utf-8?B?Zm1MZUI2OHhIWjFFalY2d0NDaXNxOGFpc1VWYlZJamFwQXpEbko5UG1zanM1?=
 =?utf-8?B?RHRwelM0S0F5TE52MWtGN1ZZd21QbStYcTE2dk9zS3ZJeGd2aHdjRUxMYWwr?=
 =?utf-8?B?clB5cDY3d0R4djZhYjFoOGJ2ZWZKYWJUeTU1V1FaaXNwQVJPcVROTEQ3TXZD?=
 =?utf-8?B?Ylk5OWpETitwb3hiY2wvcDRpc2VSMk8rWlM0UEFFMEZQdWZmTVMxQWxqcXBW?=
 =?utf-8?B?dkNDTytqcEtOTGZneFFwZnNCWU02N29LcFBUTkFGblRLYmdMbk1DcEI3OXk1?=
 =?utf-8?Q?W4AA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2010f076-85e5-4319-36dd-08dd66e89ca5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 13:19:00.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjhVureJMigUE5N2l+G/JkYqwUW9dYUhyYUrM9PjBerP0/+PMfVMSY1jM0cEj2fGw3ueDOp2FBva+GLJCvAOgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_061911_126399_AC11F3A6 
X-CRM114-Status: GOOD (  30.98  )
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMDI6NDE6NDdQTSArMDAwMCwgUWFzaW0gSWpheiB3cm90
ZToKPiBPbiBUdWUsIE1hciAxOCwgMjAyNSBhdCAwOTo0MDoxN0FNIC0wNDAwLCBGcmFuayBMaSB3
cm90ZToKPiA+IE9uIE1vbiwgTWFyIDE3LCAyMDI1IGF0IDEwOjE1OjE2QU0gKzAwMDAsIFFhc2lt
IElqYXogd3JvdGU6Cj4gPiA+IHN2Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoKSBkZWNsYXJl
cyBkeW5fYWRkciBhcyBhbiB1bnNpZ25lZCBpbnQKPiA+ID4gaG93ZXZlciBpdCBpbml0aWFsaXNl
cyBpdCB3aXRoIGkzY19tYXN0ZXJfZ2V0X2ZyZWVfYWRkcigpIHdoaWNoCj4gPiA+IHJldHVybnMg
YSBzaWduZWQgaW50IHR5cGUgYW5kIHRoZW4gYXR0ZW1wdHMgdG8gY2hlY2sgaWYgZHluX2FkZHIg
aXMKPiA+ID4gbGVzcyB0aGFuIDAuIFVuc2lnbmVkIGludGVnZXJzIGNhbm5vdCBiZSBsZXNzIHRo
YW4gMCwgc28gdGhlIGNoZWNrCj4gPiA+IGlzIGVzc2VudGlhbGx5IHJlZHVuZGFudC4gRnVydGhl
cm1vcmUgaTNjX21hc3Rlcl9nZXRfZnJlZV9hZGRyKCkKPiA+ID4gY291bGQgcmV0dXJuIC1FTk9N
RU0gd2hpY2ggYW4gdW5zaWduZWQgaW50IGNhbm5vdCBzdG9yZS4KPiA+ID4KPiA+ID4gRml4IHRo
aXMgYnkgY2FwdHVyaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YgaTNjX21hc3Rlcl9nZXRfZnJlZV9h
ZGRyKCkKPiA+ID4gaW4gYSBzaWduZWQgaW50IOKAmGR5bl9hZGRyX3JldOKAmS4gSWYgdGhhdCB2
YWx1ZSBpcyBuZWdhdGl2ZSwgcmV0dXJuCj4gPiA+IGFuIGVycm9yLiBPdGhlcndpc2UsIGFzc2ln
biBpdCB0byB0aGUgdW5zaWduZWQgaW50IOKAmGR5bl9hZGRy4oCZIG9uY2UKPiA+ID4gd2Uga25v
dyBpdOKAmXMgdmFsaWQuCj4gPiA+Cj4gPiA+IEZpeGVzOiA0MDA4YTc0ZTBmOWIgKCJpM2M6IG1h
c3Rlcjogc3ZjOiBGaXggbnBjbTg0NSBGSUZPIGVtcHR5IGlzc3VlIikKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUWFzaW0gSWpheiA8cWFzZGV2MDBAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiBU
aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsIGJ1dCBzaW1pbGFyIG9uZSB3YXMgYWxyZWFkeSBhcHBs
aWVkCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pM2MvMTc0MjI1MTU4MjEwLjE1
OTM2MTAuMTAwMTg4MTI3ODA3MzE4NDk0MDkuYjQtdHlAYm9vdGxpbi5jb20vVC8jbTUxMjBlMWMz
NjJlN2U1N2Y0Y2FiMTM5YTQ1NDEwZmRlNDIxYzJmMzcKPiA+Cj4KPiBIaSBGcmFuawo+Cj4gSSBz
ZW50IGEgZml4IGZvciB0aGlzIGlzc3VlIG9uIHRoZSA5dGggTWFyY2gsIHdoaWNoIGlzIGJlZm9y
ZSB0aGUgcGF0Y2gKPiB5b3UgbGlua2VkIHdoaWNoIHdhcyBzZW50IG9uIHRoZSAxMHRoIE1hcmNo
LgoKWWVzLCBidXQgcGVyZmVyIG9yaWdpbmFsIG93bmVyIHRvIGZpeCB0aGlzIHR5cGUgbWlub3Ig
Zml4LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaTNjLzE3NDEyOTQ0NDYxNy4xMTYz
Njg5LjExOTQyMjc2MDkzNDExNjg3Mzg3LmI0LXR5QGJvb3RsaW4uY29tL1QvI3QKCkZyYW5rCj4K
PiBZb3UgY2FuIHZpZXcgbXkgb3JpZ25hbCBwYXRjaCBoZXJlOgo+Cj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwMzA5MTY0MzE0LjE1MDM5LTEtcWFzZGV2MDBAZ21haWwuY29tLwo+
Cj4gVGhhbmtzCj4gUWFzaW0KPiA+IEZyYW5rCj4gPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYyB8IDUgKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jCj4gPiA+IGluZGV4IGYyMmZiOWU3NTE0Mi4uZWVhMDhmMDBkN2NlIDEwMDY0NAo+ID4g
PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiArKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiBAQCAtOTk4LDkgKzk5OCwx
MCBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoc3RydWN0IHN2Y19p
M2NfbWFzdGVyICptYXN0ZXIsCj4gPiA+ICAJCQkgKiBmaWxsaW5nIHdpdGhpbiBhIGZldyBodW5k
cmVkIG5hbm9zZWNvbmRzLCB3aGljaCBpcyBzaWduaWZpY2FudGx5Cj4gPiA+ICAJCQkgKiBmYXN0
ZXIgY29tcGFyZWQgdG8gdGhlIDY0IFNDTCBjbG9jayBjeWNsZXMuCj4gPiA+ICAJCQkgKi8KPiA+
ID4gLQkJCWR5bl9hZGRyID0gaTNjX21hc3Rlcl9nZXRfZnJlZV9hZGRyKCZtYXN0ZXItPmJhc2Us
IGxhc3RfYWRkciArIDEpOwo+ID4gPiAtCQkJaWYgKGR5bl9hZGRyIDwgMCkKPiA+ID4gKwkJCWlu
dCBkeW5fYWRkcl9yZXQgPSBpM2NfbWFzdGVyX2dldF9mcmVlX2FkZHIoJm1hc3Rlci0+YmFzZSwg
bGFzdF9hZGRyICsgMSk7Cj4gPiA+ICsJCQlpZiAoZHluX2FkZHJfcmV0IDwgMCkKPiA+ID4gIAkJ
CQlyZXR1cm4gLUVOT1NQQzsKPiA+ID4gKwkJCWR5bl9hZGRyID0gZHluX2FkZHJfcmV0Owo+ID4g
Pgo+ID4gPiAgCQkJd3JpdGVsKGR5bl9hZGRyLCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01XREFU
QUIpOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjM5LjUKPiA+ID4KPgo+IC0tCj4gbGludXgtaTNj
IG1haWxpbmcgbGlzdAo+IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
